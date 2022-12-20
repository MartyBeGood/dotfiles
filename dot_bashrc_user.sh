#!/bin/bash

export PATH=~/bin:$PATH
export EDITOR=nvim

# common functions
[ -f ~/.functions ] && source ~/.functions

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
