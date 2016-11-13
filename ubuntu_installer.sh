#!/bin/bash

# Adding PPA's repositories

# Add Sublime Text 3
echo "Adding Sublime Text 3.."
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y

# Add PHP 7
echo "Adding PHP 7.."
sudo add-apt-repository ppa:ondrej/php -y

# Add MySQL 5.7
echo "Adding MySQL 5.7.."
sudo add-apt-repository ppa:ondrej/mysql-5.7 -y

# Add Numix
echo "Adding Numix.."
sudo add-apt-repository ppa:numix/ppa -y

# Add Android Studio
echo "Adding Android Studio.."
sudo add-apt-repository ppa:paolorotolo/android-studio -y

# Add Ruby 2.2
echo "Adding Ruby.."
sudo apt-add-repository ppa:brightbox/ruby-ng -y

# Updating and upgrading
echo "Updating and upgrading.."
sudo apt-get update && sudo apt-get upgrade -y

# Installing Sublime Text
if ! hash subl; then
	echo "Installing Sublime Text.."
	sudo apt-get install sublime-text-installer -y
else
	echo "Sublime Text already installed"
fi

# Installing PHP 7
echo "Installing PHP 7.."
sudo apt-get install php7.0 php7.0-dev -y

# Installing MySQL 5.7
echo "Installing MySQL 5.7.."
sudo apt-get install mysql-server mysql-server-5.7 -y
sudo mysql_secure_installation
sudo mysql_install_db

# Installing Numix Theme
echo "Installing Numix Theme.."
sudo apt-get install numix-gtk-theme numix-icon-theme-circle

# Installing Android Studio
echo "Installing Android Studio.."
sudo apt-get install android-studio -y

# Installing Ruby 2.2
echo "Installing Ruby 2.2.."
sudo apt-get install ruby2.2 ruby2.2-dev -y

# Installing SASS
echo "Installing SASS.."
sudo gem install sass -y

# Installing Jekyll 
echo "Installing Jekyll.."
sudo gem install jekyll -y

# Installing NodeJS
echo "Installing NodeJS.."
sudo apt-get install nodejs nodejs-dev -y

# Installing EasyTag
echo "Installing EasyTag.."
sudo apt-get install easytag -y

# Installing Git
echo "Installing Git.."
sudo apt-get install git -y

# Installing NPM
echo "Installing NPM.."
sudo apt-get install npm -y

# Installing Gulp
echo "Installing Gulp.."
sudo npm install -g gulp

# ----------------------------

## Settings

# Git
git config --global user.email "midia.matheus@gmail.com"
git config --global user.name "Matheus Hernandes"


