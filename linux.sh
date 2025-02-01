#!/bin/bash
set -e

# Define dotfiles directories (adjust as necessary)
dotfiles_dir=~/dotfiles
dotfiles_config_dir="$dotfiles_dir/files"

# Ensure the dotfiles directory exists
if [ ! -d "$dotfiles_dir" ]; then
  echo "Dotfiles directory ($dotfiles_dir) not found."
  exit 1
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

# Install CLI packages: tmux, ripgrep, fd-find, neovim, grep
setup_cli_packages() {
    update_packages

    dependency tmux
    dependency ripgrep
    dependency fd-find
    dependency neovim
    dependency grep

    # fd-find installs the binary as 'fdfind' on Ubuntu.
    # Create a symlink so you can use 'fd' instead.
    if ! command -v fd &> /dev/null; then
        if command -v fdfind &> /dev/null; then
            echo "Creating symlink for fd (linking fdfind to fd)..."
            sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
        else
            echo "fdfind command not found. Skipping fd symlink."
        fi
    fi
}

# Setup tmux configuration and install Tmux Plugin Manager (TPM)
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
    echo "Linking tmux config..."
    ln -sf "$dotfiles_config_dir/tmux/tmux.conf" "$target_tmux_dir/tmux.conf"
}

# Setup Neovim configuration
setup_nvim() {
    echo "Setting up Neovim configuration..."

    target_nvim_dir="$HOME/.config/nvim"
    # Remove existing configuration (optional; remove if you prefer merging)
    rm -rf "$target_nvim_dir"
    mkdir -p "$target_nvim_dir"

    # Link the main init file (adjust if you use init.lua instead)
    echo "Linking Neovim init file..."
    ln -sf "$dotfiles_config_dir/nvim/init.vim" "$target_nvim_dir/init.vim"

    # Optionally, link additional configuration files recursively:
    cd "$dotfiles_config_dir/nvim"
    find . -type f | while read -r file; do
      file="${file#./}"
      mkdir -p "$target_nvim_dir/$(dirname "$file")"
      ln -sf "$dotfiles_config_dir/nvim/$file" "$target_nvim_dir/$file"
    done
    cd "$dotfiles_dir"
}

# Main script: allow choosing which part of the setup to run
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
    all)
        setup_cli_packages
        setup_tmux
        setup_nvim
        ;;
    *)
        echo -e "\nUsage: $(basename "$0") {cli|tmux|nvim|all}\n"
        exit 1
        ;;
esac

echo "Success! Ubuntu CLI environment setup complete."
