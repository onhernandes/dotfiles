# Debian 9 script
# I use this to install basic things on my server, so I can run some apps and play around

apt-get update
apt-get install python3-pip git mongodb neovim

useradd onhernandes -m
usermod -a -G sudo onhernandes

pip install virtualenv

systemctl enable mongodb
systemctl start mongodb

git clone git@github.com:onhernandes/dotfiles.git /home/onhernandes/ 

