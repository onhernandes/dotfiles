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

export TMUXINATOR_CONFIG="$HOME/.onhernandes/dotfiles/tmuxinator"
export EDITOR=vi

