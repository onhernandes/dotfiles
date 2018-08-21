# Debian 9 script
# I use this to install basic things on my server, so I can run some apps and play around

apt-get update
apt-get install python3-pip git mongodb neovim sudo

useradd onhernandes -m
usermod -a -G sudo onhernandes
chsh -s /bin/bash onhernandes

pip3 install virtualenv neovim

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

systemctl enable mongodb
systemctl start mongodb

if [[ ! -d /home/onhernandes/.local/share/nvim/plugged ]]; then
  mkdir -p /home/onhernandes/.local/share/nvim/plugged
fi                             

if [[ ! -d /home/onhernandes/.config/nvim ]]; then
  mkdir -p /home/onhernandes/.config/nvim
fi                            

git clone git@github.com:onhernandes/dotfiles.git /home/onhernandes/dotfiles
ln -s /home/onhernandes/dotfiles/vimrc /home/onhernandes/.vimrc
ln -s /home/onhernandes/dotfiles/vim /home/onhernandes/.vim
ln -s /home/onhernandes/dotfiles/commands/git/gitconfig /etc/gitconfig
ln -s /home/onhernandes/dotfiles/vimrc /home/onhernandes/.config/nvim/init.vim

