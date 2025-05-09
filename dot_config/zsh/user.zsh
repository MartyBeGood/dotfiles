# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.aliases ] && source ~/.aliases

# common functions [ -f ~/.functions ] && source ~/.functions

function kop() {
  if [ $1 ]; then lsof -n -i:$1 | grep LISTEN | awk '{ print $2 }' | uniq | xargs kill -9;
  else cat << EOF
Kills all processes on a portnumber
Usage: kop [port_number]
EOF
  fi
}

# if type zoxide &>/dev/null
# then
#   eval "$(zoxide init zsh)"
# fi

if type nvim &> /dev/null; then
  export EDITOR='nvim'
elif type vim &> /dev/null; then
  export EDITOR='vim'
elif type vi &> /dev/null; then
  export EDITOR='vi'
fi

if type starship &>/dev/null
then
  eval "$(starship init zsh)"
fi

if [ -f ~/.local/bin/mise ]; then
  eval "$(~/.local/bin/mise activate zsh)"
else
  if [ command -v 'mise' &> /dev/null ]; then
    eval "$(mise activate zsh)"
  else
    echo "mise not available. chezmoi setup might be borked."
  fi
fi
