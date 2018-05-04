#!/bin/bash

{

echo "Welcome"
echo "This setup works for Arch-based distro(I only used in Manjaro, never tested on others distros)"
DOTFILES=$HOME/.onhernandes/dotfiles
SUBLIME_USER_PACKAGE=$HOME/.config/sublime-text-3/Packages/User

ensure_home_folder() {
    if [[ ! -d $HOME/.onhernandes ]]; then
        mkdir $HOME/.onhernandes
    fi

		pacman -S --noconfirm git
		git clone git@github.com:onhernandes/dotfiles.git $DOTFILES
}

pacman_install() {
    echo "Installing Pacman Packages"

    wget https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A 
    && rm sublimehq-pub.gpg
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

    PACMAN_PACKAGES="openssh curl mariadb mongodb mongodb-tools npm nodejs
    easytag git filezilla xclip xf86-input-synaptics fzf ruby sublime-text neovim"
		pacman -S --noconfirm $PACMAN_PACKAGES
}

yaourt_install() {
    echo "Installing Yaourt Packages"
    YAOURT_PACKAGES="google-chrome spotify postman rambox"
    yaourt -S --noconfirm $YAOURT_PACKAGES
}

npm_packages_setup() {
    echo "Installing NPM Packages..."
    sudo npm install -g getme nodemon standard hexo-cli hexo jest jest-cli
    neovim
}

services_setup() {
    echo "Setting some services"
    SERVICES=(mysqld mongodb)
    sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    for serv in ${SERVICES[@]}; do
        systemctl enable $serv
        systemctl start $serv
    done
}

dotfiles_setup() {
    echo "Setting misc dotfiles"

    # Set .gitconfig
    if [[ -f $DOTFILES/commands/git/.gitconfig ]]; then
        ln -s $DOTFILES/commands/git/.gitconfig $HOME/.gitconfig
    fi

    # Setting ST3 files
    if [[ -d $SUBLIME_USER_PACKAGE ]]; then
        ln -s $DOTFILES/sublime/Package\ Control.sublime-settings $SUBLIME_USER_PACKAGE
        ln -s $DOTFILES/sublime/Preferences.sublime-settings $SUBLIME_USER_PACKAGE
    fi

    # Setting custom commands
    chmod +x $DOTFILES/commands/gitlist && ln -s $DOTFILES/commands/gitlist /usr/bin
    chmod +x $DOTFILES/commands/license-mit && ln -s $DOTFILES/commands/license-mit /usr/bin
    chmod +x $DOTFILES/commands/subl-snippet && ln -s $DOTFILES/commands/subl-snippet /usr/bin

		# Setting vim and tmux config
		if [[ ! -d $HOME/.local/share/nvim/plugged ]]; then
		  mkdir $HOME/.local/share/nvim/plugged
    fi 

		ln -s $DOTFILES/vimrc $HOME/.vimrc
		ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
}

initialize_me() {
    ensure_home_folder
    pacman_install
    yaourt_install

    npm_packages_setup
    services_setup
    dotfiles_setup
}

initialize_me

}
