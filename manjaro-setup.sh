echo "Welcome"
echo "This setup works for Arch-based distro(I only used in Manjaro, never tested on others distros)"
DOTFILES=$HOME/.onhernandes/dotfiles
SUBLIME_USER_PACKAGE=$HOME/.config/sublime-text-3/Packages/User

ensure_home_folder() {
    if [[ ! -d $HOME/.onhernandes ]]; then
        mkdir $HOME/.onhernandes
    fi
}

pacman_install() {
    echo "Installing Pacman Packages"

    wget https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A 
    && rm sublimehq-pub.gpg
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

    PACMAN_PACKAGES=(
        openssh
        curl
        apache
        php
        php-apache
        composer
        mariadb
        mongodb
        mongodb-tools
        php-mongodb
        npm
        nodejs
        easytag
        git
        filezilla
        xclip
        xf86-input-synaptics
        ruby
        sublime-text
    )

    for pack in ${PACMAN_PACKAGES[@]}; do
        echo "Installing ${pack}"
        pacman -S --noconfirm $pack
    done
}

yaourt_install() {
    echo "Installing Yaourt Packages"

    YAOURT_PACKAGES=(
        google-chrome
        spotify
    )

    for pack in ${YAOURT_PACKAGES[@]}; do
        echo "Installing ${pack}"
        yaourt -S --noconfirm $pack
    done
}

npm_packages_setup() {
    echo "Installing NPM Packages..."
    sudo npm install -g gulp getme forever nodemon standard hexo-cli
}

ruby_gems_setup() {
    echo "Installing Ruby gems..."
    sudo gem install sass
}

services_setup() {
    echo "Setting some services"
    SERVICES=(mysqld httpd mongodb)
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
        cp $DOTFILES/commands/git/.gitconfig > $HOME/.gitconfig
    fi

    # Setting ST3 files
    if [[ -d $SUBLIME_USER_PACKAGE ]]; then
        cp $DOTFILES/sublime/Package\ Control.sublime-settings > $SUBLIME_USER_PACKAGE
        cp $DOTFILES/sublime/Preferences.sublime-settings > $SUBLIME_USER_PACKAGE
    fi

    # Setting custom commands
    chmod +x $DOTFILES/commands/gitlist && cp $DOTFILES/commands/gitlist /usr/bin
    chmod +x $DOTFILES/commands/license-mit && cp $DOTFILES/commands/license-mit /usr/bin
    chmod +x $DOTFILES/commands/subl-snippet && cp $DOTFILES/commands/subl-snippet /usr/bin
}

initialize_me() {
    ensure_home_folder()
    pacman_install()
    yaourt_install()

    git clone git@github.com:onhernandes/dotfiles.git $DOTFILES

    npm_packages_setup()
    ruby_gems_setup()
    services_setup()
    dotfiles_setup()
}
