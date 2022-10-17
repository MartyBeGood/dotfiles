zsh_config_dir=${0:a:h}
# basic env vars
export EDITOR=nvim

# chruby
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

# plugins
[ -f $zsh_config_dir/antigen.zsh ] && source $zsh_config_dir/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell
antigen apply
