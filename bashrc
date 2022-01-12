if [[ -f $HOME/.git-completion.bash ]]; then
  . $HOME/.git-completion.bash
fi

if [[ -f $HOME/.tmuxinator.bash ]]; then
  . $HOME/.tmuxinator.bash
fi

if [[ -f $HOME/.tmux/mux.bash ]]; then
  . $HOME/.tmux/mux.bash
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [[ $(command -v kubectl 2>/dev/null) ]]; then
  source <(kubectl completion bash)
fi

if [[ -f $HOME/.asdf/asdf.sh ]]; then
  source $HOME/.asdf/asdf.sh
fi

if [[ -d $HOME/Android ]]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
# else
#   echo "You need to manually configure Android Studio. Open it, it'll ask to set the JDK path, which you can get from: asdf which java."
#   echo "Then it'll install some components. Visit https://reactnative.dev/docs/environment-setup and see which items need to be downloaded (currently, Android SDK Platform 29 and Intel x86 Atom_64 System Image or Google APIs Intel x86 Atom System Image)"
#   echo "After downloading everything, source ~/.bashrc. This warning will disappear and \$ANDROID_HOME will be properly set"
fi

if [[ -f $HOME/.asdf/plugins/java/set-java-home.bash ]]; then
  source $HOME/.asdf/plugins/java/set-java-home.bash
fi

export NVIM_TUI_ENABLE_TRUE_COLOR=1
export TMUXINATOR_CONFIG="$HOME/.onhernandes/dotfiles/tmuxinator"
export EDITOR=vi
export DOTFILES="$HOME/.onhernandes/dotfiles"
export PIPENV_VENV_IN_PROJECT=1
export NODE_ENV="development"

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $(command -v powerline-shell) && $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Aliases
alias v='nvim'
alias r='source $HOME/.bashrc'
alias dotfiles-git="git --work-tree=${DOTFILES} --git-dir=${DOTFILES}/.git"
alias rpy="source venv/bin/activate"
alias clone="git clone"
alias ups="sudo systemctl start"
alias downs="sudo systemctl stop"
alias dps="docker ps -a"
alias dlogs="docker logs -f"
# export PS1="${PS1}\n\$ "

ssh-clone () {
  git clone git@github.com:$1.git
}

https-clone () {
  git clone https://github.com/$1.git
}
