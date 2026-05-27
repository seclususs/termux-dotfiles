#######################
# Zsh extensions loader
#######################

ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"

fpath=($ZSH_PLUGINS_DIR/zsh-completions/src $fpath)

autoload -Uz compinit
compinit

[ -f $PREFIX/share/fzf/completion.zsh ] && source $PREFIX/share/fzf/completion.zsh
[ -f $PREFIX/share/fzf/key-bindings.zsh ] && source $PREFIX/share/fzf/key-bindings.zsh

if [[ -f "$ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
    source "$ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
    
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

if [[ -f "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5c6370"
fi

if [[ -f "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [[ -f "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh" ]]; then
    source "$ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh"
fi
