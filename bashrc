if [[ -f $HOME/.git-completion.bash ]]; then
  . $HOME/.git-completion.bash
fi

if [[ -f $HOME/.tmux/tmuxinator.bash ]]; then
  . $HOME/.tmux/tmuxinator.bash
fi

export TMUXINATOR_CONFIG="$HOME/.onhernandes/dotfiles/tmuxinator"
export EDITOR=vi
