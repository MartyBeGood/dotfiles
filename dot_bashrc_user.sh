#!/bin/bash

export PATH=~/bin:$PATH
export EDITOR=nvim

function kop() {
  if [ $1 ]; then lsof -n -i:$1 | grep LISTEN | awk '{ print $2 }' | uniq | xargs kill -9;
  else cat << EOF
Kills all processes on a portnumber
Usage: kop [port_number]
EOF
  fi
}

# alias tmux='tmux -2'
function tn { if [ "$1" ]; then tmux new -s "$1"; else tmux new -s "$(basename "$PWD" | tr . _)"; fi }
function ta { if [ "$1" ]; then tmux attach -t "$1"; else tmux attach; fi }
