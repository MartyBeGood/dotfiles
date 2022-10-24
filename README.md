# Dotfiles

## Install

1. Fork this repo
1. Install [chezmoi](https://www.chezmoi.io/install). Having the `chezmoi` binary on your path is convenient
1. Run `chezmoi init <YOUR_GITHUB_USERNAME>`. It will prompt you for a few inputs like your name & email address
1. [optional] Run `chezmoi diff` to see which files would clash with your existing config. Back up things you want to store & reintroduce later.
1. Run `chezmoi apply`. It will not overwrite existing files without asking you
1. In your shell's init file, source the appropriate customization:
    - If you use zsh, source `~/.config/zsh/user.zsh`
    - If you use bash, source `~/.bashrc_user.sh`
    - Note that I use zsh, so the bash files receive a bit less love. I do my best to keep the functionality the same though.

