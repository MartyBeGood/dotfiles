zsh_config_dir=${0:a:h}
# basic env vars
export EDITOR=nvim

# chruby
[ -f $zsh_config_dir/chruby.zsh ] && source &zsh_config_dir/chruby.zsh


# plugins
[ -f $zsh_config_dir/antigen.zsh ] && source $zsh_config_dir/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell
antigen apply
