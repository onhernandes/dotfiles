#!/bin/bash
# Setup some basic things

# Custom user(it's the same used on Github) dev folder
sCUSTOM_USER=~/onhernandes

# check if the folder exists then create(and insert a variable at .bashrc)
if [ ! -d "$sCUSTOM_USER" ]; then
	echo "Creating $sCUSTOM_USER"
	mkdir $sCUSTOM_USER
	echo 'export CUSTOM_USER=$HOME/onhernandes' >> ~/.bashrc
fi

# Go to user folder
cd ~/

# Move misc-files to dev folder
mv ./dev-misc/* $CUSTOM_USER

# Make some commands executable(I still will figure out how to do this dinamically)
sudo chmod +x ./commands/license-mit
sudo chmod +x ./commands/ll

# Move commands to /usr/bin/
sudo mv ./commands/* /usr/bin/

# Move my git files to user root(such as .gitconfig)
mv ./git/* ~/
