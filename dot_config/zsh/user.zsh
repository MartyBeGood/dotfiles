zsh_config_dir=${0:a:h}
# basic env vars
export EDITOR=nvim

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

eval "$(~/.local/bin/rtx activate zsh)"
