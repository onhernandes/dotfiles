# Debian 9 script
# I use this to install basic things on my server, so I can run some apps and play around

apt-get update
apt-get install python3-pip git mongodb neovim sudo

useradd onhernandes -m
usermod -a -G sudo onhernandes
chsh -s /bin/bash onhernandes

pip install virtualenv

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

