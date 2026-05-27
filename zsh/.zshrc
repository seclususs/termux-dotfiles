########################
# Main Zsh configuration
########################

ZSH_CONFIG_DIR="$HOME/termux-dotfiles/zsh"

source "$ZSH_CONFIG_DIR/env.zsh"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

source "$ZSH_CONFIG_DIR/functions.zsh"

source "$ZSH_CONFIG_DIR/aliases.zsh"

source "$ZSH_CONFIG_DIR/prompt.zsh"

source "$ZSH_CONFIG_DIR/plugins.zsh"

if [[ -f "$HOME/.dircolors" ]]; then
    eval $(dircolors -b "$HOME/.dircolors")
fi
