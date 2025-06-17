#!/bin/bash

export PATH=~/.local/bin:~/bin:$PATH
export EDITOR=nvim

# common functions
[ -f ~/.functions ] && source ~/.functions

# common aliases
[ -f ~/.aliases ] && source ~/.aliases

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.local/bin/mise ]; then
  eval "$(~/.local/bin/mise activate bash)"
else
  if [ command -v 'mise' ] &>/dev/null; then
    eval "$(mise activate bash)"
  else
    echo "mise not available. chezmoi setup might be borked."
  fi
fi

# load starship prompt if the command exists
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
fi

# load zoxide if it exists
if [ -x  "$(command -v zoxide)" ]; then
  eval "$(zoxide init bash)"
fi
