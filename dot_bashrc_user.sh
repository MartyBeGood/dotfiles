#!/bin/bash

export PATH=~/bin:$PATH

function tn { if [ "$1" ]; then tmux new -s "$1"; else tmux new -s "$(basename "$PWD" | tr . _)"; fi }
function ta { if [ "$1" ]; then tmux attach -t "$1"; else tmux attach; fi }
