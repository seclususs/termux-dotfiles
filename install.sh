#!/data/data/com.termux/files/usr/bin/bash

##################
# Termux installer
##################

echo "[*] Requesting Android Storage permission..."
termux-setup-storage
sleep 2

echo "[*] Enabling extra repositories..."
pkg update -y
pkg install -y root-repo x11-repo
pkg upgrade -y

echo "[*] Installing core packages..."
pkg install -y zsh git wget curl ncurses-utils bc coreutils findutils grep sed gawk termux-exec termux-api termux-services nano fzf openssh unzip tar p7zip

DOTFILES_DIR="$HOME/termux-dotfiles"
ZSH_DIR="$HOME/.zsh"
ZSH_PLUGINS_DIR="$ZSH_DIR/plugins"

mkdir -p "$ZSH_PLUGINS_DIR"
mkdir -p "$HOME/.termux"
mkdir -p "$DOTFILES_DIR/nano"

echo "[*] Muting default Termux MOTD..."
touch "$HOME/.hushlogin"

echo "[*] Setting up sudo wrapper..."
read -r -p "Create your sudo password: " -s SUDO_PASS
echo ""
read -r -p "Confirm sudo password: " -s SUDO_PASS_CONFIRM
echo ""

if [[ "$SUDO_PASS" == "$SUDO_PASS_CONFIRM" ]]; then
    echo -n "$SUDO_PASS" | sha256sum | awk '{print $1}' > "$HOME/.sudo_hash"
    chmod 600 "$HOME/.sudo_hash"
    echo "    [+] Sudo hash generated successfully."
else
    echo "    [-] Passwords do not match. Sudo will be disabled. Run installer again to fix."
fi

echo "[*] Fetching Zsh plugins..."
declare -A PLUGINS=(
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions.git"
    ["zsh-completions"]="https://github.com/zsh-users/zsh-completions.git"
    ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search.git"
    ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab.git"
)

for PLUGIN in "${!PLUGINS[@]}"; do
    if [ ! -d "$ZSH_PLUGINS_DIR/$PLUGIN" ]; then
        git clone --depth 1 "${PLUGINS[$PLUGIN]}" "$ZSH_PLUGINS_DIR/$PLUGIN"
    else
        echo "    [*] $PLUGIN already installed, skipping."
    fi
done

echo "[*] Creating quick storage symlinks..."
ln -sfn ~/storage/downloads ~/Downloads
ln -sfn ~/storage/dcim ~/Pictures
ln -sfn ~/storage/shared ~/Documents

echo "[*] Symlinking configurations..."
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/colors/.dircolors" "$HOME/.dircolors"
ln -sf "$DOTFILES_DIR/termux/colors.properties" "$HOME/.termux/colors.properties"
ln -sf "$DOTFILES_DIR/termux/termux.properties" "$HOME/.termux/termux.properties"
ln -sf "$DOTFILES_DIR/nano/.nanorc" "$HOME/.nanorc"

termux-reload-settings

if [[ "$SHELL" != *"/zsh" ]]; then
    echo "[*] Changing default shell to zsh..."
    chsh -s zsh
fi

echo "[+] Installation complete! Please restart your Termux session."
