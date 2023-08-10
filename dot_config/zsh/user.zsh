# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zsh_config_dir=${0:a:h}

# env vars
export EDITOR=nvim
export PATH=$HOME/.local/bin:$PATH

# plugin management
source $zsh_config_dir/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k

antigen apply
# end plugin management

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# common functions
[ -f ~/.functions ] && source ~/.functions

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f ~/.local/bin/rtx ]; then
  eval "$(~/.local/bin/rtx activate zsh)"
else
  if [ command -v 'rtx' &> /dev/null ]; then
    eval "$(rtx activate zsh)"
  else
    echo "rtx not available. chezmoi setup might be borked."
  fi
fi
