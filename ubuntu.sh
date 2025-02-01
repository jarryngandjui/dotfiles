#!/bin/bash
set -e

# Define dotfiles directories (adjust these paths if needed)
dotfiles_dir=~/dotfiles
dotfiles_config_dir="$dotfiles_dir/files"

# Ensure the dotfiles directory exists
if [ ! -d "$dotfiles_dir" ]; then
  echo "Dotfiles directory ($dotfiles_dir) not found."
fi

cd "$dotfiles_dir"

# Function to check and install a package via apt-get
dependency() {
    local package=$1
    if dpkg -s "$package" &> /dev/null; then
        echo "'$package' is already installed."
    else
        echo "Installing '$package'..."
        sudo apt-get install -y "$package"
    fi
}

# Update package lists
update_packages() {
    echo "Updating package lists..."
    sudo apt-get update
}

# Install CLI packages: tmux, ripgrep, fd-find, neovim, grep, and zsh
setup_cli_packages() {
    update_packages

    dependency tmux
    dependency ripgrep
    dependency fd-find
    dependency neovim
    dependency grep
    dependency zsh

    # fd-find installs the binary as 'fdfind'; create a symlink for convenience.
    if ! command -v fd &> /dev/null; then
        if command -v fdfind &> /dev/null; then
            echo "Creating symlink for fd (linking fdfind to fd)..."
            sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
        else
            echo "fdfind command not found. Skipping fd symlink."
        fi
    fi
}

# Setup Tmux configuration and install Tmux Plugin Manager (TPM)
setup_tmux() {
    echo "Setting up Tmux configuration..."
    TPM_DIR="$HOME/.tmux/plugins/tpm"
    if [ ! -d "$TPM_DIR" ]; then
        echo "Cloning Tmux Plugin Manager..."
        git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    else
        echo "Tmux Plugin Manager already exists."
    fi

    target_tmux_dir="$HOME/.config/tmux"
    mkdir -p "$target_tmux_dir"
    echo "Linking tmux configuration..."
    ln -sf "$dotfiles_config_dir/tmux/tmux.conf" "$target_tmux_dir/tmux.conf"
}

# Setup Neovim configuration
setup_nvim() {
    echo "Setting up Neovim configuration..."
    target_nvim_dir="$HOME/.config/nvim"
    rm -rf "$target_nvim_dir"
    mkdir -p "$target_nvim_dir"

    echo "Linking Neovim init file..."
    ln -sf "$dotfiles_config_dir/nvim/init.vim" "$target_nvim_dir/init.vim"

    # Optionally, link additional configuration files recursively.
    cd "$dotfiles_config_dir/nvim"
    find . -type f | while read -r file; do
      file="${file#./}"
      mkdir -p "$target_nvim_dir/$(dirname "$file")"
      ln -sf "$dotfiles_config_dir/nvim/$file" "$target_nvim_dir/$file"
    done
    cd "$dotfiles_dir"
}

# Setup Zsh and Oh My Zsh configuration
setup_shell() {
    echo "Setting up Zsh and Oh My Zsh configuration..."

    # Zsh is already installed as part of CLI packages.
    OH_MY_ZSH="$HOME/.oh-my-zsh"
    OH_MY_ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    if [ -d "$OH_MY_ZSH" ]; then
      echo "Oh My Zsh is already installed."
    else
      echo "Installing Oh My Zsh..."
      # Install Oh My Zsh unattended so it doesn't switch shells automatically.
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
      # Change default shell to zsh.
      chsh -s "$(which zsh)"
      echo "Oh My Zsh installed successfully."
    fi

    # Install Dracula theme for Zsh.
    DRACULA_THEME_DIR="${OH_MY_ZSH_CUSTOM}/themes/dracula"
    if [ ! -d "$DRACULA_THEME_DIR" ]; then
        echo "Installing Dracula theme..."
        git clone https://github.com/dracula/zsh.git "$DRACULA_THEME_DIR"
        ln -sf "${DRACULA_THEME_DIR}/dracula.zsh-theme" "${OH_MY_ZSH_CUSTOM}/themes/dracula.zsh-theme"
        echo "Dracula theme installed."
    else
        echo "Dracula theme already installed."
    fi

    # Install zsh-autosuggestions plugin.
    ZSH_AUTOSUGGESTIONS_DIR="${OH_MY_ZSH_CUSTOM}/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        echo "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AUTOSUGGESTIONS_DIR"
    else
        echo "zsh-autosuggestions is already installed."
    fi

    # Link Zsh configuration files from your dotfiles.
    echo "Linking Zsh configuration files..."
    mkdir -p "$HOME/.config/zsh"
    ln -sf "$dotfiles_config_dir/zsh/zshrc" "$HOME/.zshrc"
    ln -sf "$dotfiles_config_dir/zsh/"* "$HOME/.config/zsh/"
}

# Main: Choose which parts to run based on the argument passed.
case "$1" in
    cli)
        setup_cli_packages
        ;;
    tmux)
        setup_tmux
        ;;
    nvim)
        setup_nvim
        ;;
    shell)
        setup_shell
        ;;
    all)
        setup_cli_packages
        setup_shell
        setup_nvim
        setup_tmux
        ;;
    *)
        echo -e "\nUsage: $(basename "$0") {cli|tmux|nvim|shell|all}\n"
        exit 1
        ;;
esac

echo "Success! Ubuntu CLI environment setup complete."
