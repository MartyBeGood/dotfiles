zsh_config_dir=${0:a:h}
# basic env vars
export EDITOR=nvim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# common functions
[ -f ~/.functions ] && source ~/.functions

# plugins
[ -f $zsh_config_dir/antigen.zsh ] && source $zsh_config_dir/antigen.zsh

# brew completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

function kop() {
  if [ $1 ]; then lsof -n -i:$1 | grep LISTEN | awk '{ print $2 }' | uniq | xargs kill -9;
  else cat << EOF
Kills all processes on a portnumber
Usage: kop [port_number]
EOF
  fi
}

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen apply

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(rtx activate zsh)"

# rtx isn't ready for the rest of this file
eval "$(rtx x starship -- starship init zsh)"
