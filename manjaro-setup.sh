echo "Welcome"
echo "This setup works for Arch-based distro(I only used in Manjaro, never tested on Arch-x distro)"
echo "Starting..."

echo "Installing ST"
sudo pacman -S --noconfirm sublime-text

echo "Installing Apache..."
sudo pacman -S --noconfirm apache

echo "Installing PHP and Composer..."
sudo pacman -S --noconfirm php php-apache composer

echo "Installing MySQL..."
sudo pacman -S --noconfirm mariadb

echo "Installing NPM and NodeJS..."
sudo pacman -S --noconfirm npm nodejs

echo "Installing EasyTag..."
sudo pacman -S --noconfirm easytag

echo "Installing Git..."
sudo pacman -S --noconfirm git

echo "Installing FileZilla..."
sudo pacman -S --noconfirm filezilla

echo "Installing NPM globals..."

echo "Installing Gulp, getme, forever, nodemon..."
sudo npm install -g gulp getme forever nodemon jshint

echo "Installing ruby..."
sudo pacman -S --noconfirm ruby

echo "Installing SASS..."
sudo gem install sass

echo "Installing Jekyll..."
sudo gem install jekyll
