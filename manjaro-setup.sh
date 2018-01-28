echo "Welcome"
echo "This setup works for Arch-based distro(I only used in Manjaro, never tested on Arch-x distro)"
echo "Starting..."

echo "Installing OpenSSH"
sudo pacman -S --noconfirm openssh

echo "Installing CURL"
sudo pacman -S --noconfirm curl

echo "Installing Apache..."
sudo pacman -S --noconfirm apache

echo "Installing PHP and Composer..."
sudo pacman -S --noconfirm php php-apache composer

echo "Installing MySQL..."
sudo pacman -S --noconfirm mariadb

echo "Installing MongoDB"
sudo pacman -S --noconfirm mongodb mongodb-tools php-mongodb

echo "Installing NPM and NodeJS..."
sudo pacman -S --noconfirm npm nodejs

echo "Installing EasyTag..."
sudo pacman -S --noconfirm easytag

echo "Installing Git..."
sudo pacman -S --noconfirm git

echo "Installing FileZilla..."
sudo pacman -S --noconfirm filezilla

echo "Installing xclip..."
sudo pacman -S --noconfirm xclip

echo "Installing GoogleChrome..."
sudo yaourt -S google-chrome --noconfirm

echo "Installing synaptics-input..."
sudo pacman -S --noconfirm xf86-input-synaptics

echo "Installing ST3.."
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A 
&& rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu --noconfirm sublime-text

echo "Installing Spotify..."
yaourt -S spotify --noconfirm

echo "Installing NPM globals..."

echo "Installing Gulp, getme, forever, nodemon..."
sudo npm install -g gulp getme forever nodemon jshint

echo "Installing ruby..."
sudo pacman -S --noconfirm ruby

echo "Installing SASS..."
sudo gem install sass

echo "Installing Jekyll..."
sudo gem install jekyll

echo "Setting MySQL, Apache and MongoDB"
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable mysqld
sudo systemctl start mysqld
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl enable mongodb
sudo systemctl start mongodb

echo "Setting ST3"
curl https://raw.githubusercontent.com/onhernandes/dotfiles/master/sublime/Package%20Control.sublime-settings > 
~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings

# Wait for install all of the packages, then close and download Preferences
