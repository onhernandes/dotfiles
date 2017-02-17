echo "Welcome"
echo "This setup works for Arch-based distro"
echo "Starting..."

echo "Installing Apache..."
sudo pacman -S --noconfirm apache

echo "Installing PHP..."
sudo pacman -S --noconfirm php php-apache

echo "Installing MySQL..."
sudo pacman -S --noconfirm mysql

echo "Installing NPM and NodeJS..."
sudo pacman -S --noconfirm npm nodejs

echo "Installing EasyTag..."
sudo pacman -S --noconfirm easytag

echo "Installing Git..."
sudo pacman -S --noconfirm git

echo "Installing Gulp..."
sudo npm install -g gulp

echo "Installing getme..."
sudo npm install getme

echo "Installing SASS..."
sudo gem install sass

echo "Installing Jekyll..."
sudo gem install jekyll

echo "Now, the next programs will be installed from AUR"

