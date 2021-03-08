#!/bin/bash

DOTFILES=$HOME/.onhernandes/dotfiles

if [[ ! -d $HOME/.onhernandes ]]; then
    mkdir $HOME/.onhernandes
fi

if ! git_cmd="$(type -p "git")" || [[ -z $git_cmd ]]; then
  sudo pamac install --noconfirm git
fi

if [[ ! -d $HOME/.ssh ]] || [[ ! -e $HOME/.ssh/id_rsa.pub ]]; then
  ssh-keygen
fi

echo \n\n
cat $HOME/.ssh/id_rsa.pub
echo "After logging on Github, run "
echo "curl -o- https://raw.githubusercontent.com/onhernandes/dotfiles/master/setup/install.sh | bash"
