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

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

export TMUXINATOR_CONFIG="$HOME/.onhernandes/dotfiles/tmuxinator"
export EDITOR=vi

if [[ $(command -v powerline-shell) && $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Aliases
alias v='nvim'
alias r='source $HOME/.bashrc'
