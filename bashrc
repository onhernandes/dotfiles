if [[ -f $HOME/.git-completion.bash ]]; then
  . $HOME/.git-completion.bash
fi

if [[ -f $HOME/.tmux/tmuxinator.bash ]]; then
  . $HOME/.tmux/tmuxinator.bash
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

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

#export TERM="xterm-256color"
export TMUXINATOR_CONFIG="$HOME/.onhernandes/dotfiles/tmuxinator"
export EDITOR=vi
export DOTFILES="$HOME/.onhernandes/dotfiles"
export PIPENV_VENV_IN_PROJECT=1

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

ssh-clone () {
  git clone git@github.com:$1.git
}

https-clone () {
  git clone https://github.com/$1.git
}
