echo "Welcome"
echo "This setup works for Arch-based distro"
echo "Starting..."

echo "Installing Apache..."
sudo pacman -S --noconfirm apache

echo "Installing PHP and Composer..."
sudo pacman -S --noconfirm php php-apache composer

echo "Installing MySQL..."
sudo pacman -S --noconfirm mysql

echo "Installing NPM and NodeJS..."
sudo pacman -S --noconfirm npm nodejs

echo "Installing EasyTag..."
sudo pacman -S --noconfirm easytag

echo "Installing Git..."
sudo pacman -S --noconfirm git

echo "Installing FileZilla..."
sudo pacman -S --noconfirm filezilla

echo "Installing NPM globals..."

echo "Installing Gulp..."
sudo npm install -g gulp

echo "Installing getme..."
sudo npm install -g getme

echo "Installing jshint..."
sudo npm install -g jshint

echo "Installing ruby..."
sudo pacman -S --noconfirm ruby

echo "Installing SASS..."
sudo gem install sass

echo "Installing scss_lint..."
sudo gem install scss_lint

echo "Installing Jekyll..."
sudo gem install jekyll

echo "Now, the next programs will be installed from AUR"

echo "Installing SublimeText3..."
yaourt -S --noconfirm sublime-text-dev