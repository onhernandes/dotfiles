#!/bin/bash
# Setup some basic things

sCUSTOM_USER=~/onhernandes


if [ ! -d "$sCUSTOM_USER" ]; then
	echo "Creating $sCUSTOM_USER"
	mkdir $sCUSTOM_USER
	echo 'export CUSTOM_USER=$HOME/onhernandes' >> ~/.bashrc
fi

mv ./dev-misc/* $CUSTOM_USER
sudo chmod +x ./commands/license-mit
sudo chmod +x ./commands/ll
sudo mv ./commands/* /usr/bin/
mv ./git/* ~/

# TODO: create some basic frameworks for developing websites, static-blogs, basic gulpfile and etc
