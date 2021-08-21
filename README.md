# dotfiles

That's my dotfiles folder with many things that I can't work without them.

# Pre-install Script

First, you'll have to execute the pre-install script

```
curl -o- https://raw.githubusercontent.com/onhernandes/dotfiles/main/setup/pre-install | bash
```

or

```
wget -qO- https://raw.githubusercontent.com/onhernandes/dotfiles/main/setup/pre-install | bash
```

It creates `~/.onhernandes` if it doesn't exists, installs git and setup a new SSH key if there's no either `~/.ssh` or `~/.ssh/id_rsa.pub`. Then you should login to Github, setup your SSH keys and then execute the install script:

# Install Script

```
curl -o- https://raw.githubusercontent.com/onhernandes/dotfiles/main/setup/install | bash
```

or

```
wget -qO- https://raw.githubusercontent.com/onhernandes/dotfiles/main/setup/install | bash
```

## What does it install?

It works only for Manjaro. If you've `pacman`, I think it'll work just fine

Installs:
- openssh
- docker
- docker-compose
- curl
- unzip
- arandr
- autorandr
- xclip (used by neovim)
- xf86 input synaptics
- fzf (used by neovim)
- cmake
- freetype2
- fontconfig
- pkg-config
- make
- rustup
- powerline-fonts (used by powerline)
- kitty (my fav term emulator)
- tmux
- firefox dev edition
- kubectl
- shfmt (formats shell scripts)
- telegram-desktop
- python2-pip (by default, python and pip comes into v3, but there's no pip2.8)
- gnome-tweaks
- google-chrome (Unfortunately, I've to use Google Chrome for Google Meet, because it consumes 100% of my CPU on firefox)
- watchman
- android studio
- asdf-vm (multi-lang version manager)
- bat
- the silver searcher


It also installs (without pacman):
- nvm
- tpm (tmux plugin manager)

From snap:
- spotify

From NPM:
- neovim
- jjson (for neovim)
- typescript
- vtop (prettier than htop IMHO)

From pip:
- pynvim
- powerline-shell
- flake8
- black
- pipenv

Ruby gems:
- rdoc
- neovim
- tmuxinator

## Other directories

It also creates the following dirs, in case they don't exist yet:

- `~/.local/share/nvim/plugged`
- `~/.config/nvim`
- `~/.tmux/plugins`
- `~/.config/nvim/ftplugin`
- `~/.config/powerline-shell`

# Other downloads

- Tmuxinator completion script for bash
- Git completion script for bash

## Symlinks

Finally, it creates the following symlinks:

| From | To |
| `$DOTFILES/git/gitconfig` | `~/.gitconfig` |
| `$DOTFILES/vimrc` | `~/.config/nvim/init.vim` |
| `$DOTFILES/vim/ftplugin/python.vim` | `~/.config/nvim/ftplugin/python.vim` |
| `$DOTFILES/python/flake8` | `~/.config/.flake8` |
| `$DOTFILES/tmux.conf` | `~/.tmux.conf` |
| `$DOTFILES/powerline.json` | `~/.config/powerline-shell/config.json` |
