#!/bin/bash

# Just making sure
mkdir -p ~/.config

function dependency {
    local package=$1
    local install_type=${2:-} # Default to empty if not provided

    # Lowercase conversion for cross-shell compatibility
    install_type=$(echo "$install_type" | awk '{print tolower($0)}')

    if brew list --formula "$package" &> /dev/null; then
        echo "'$package' formula is already installed."
    elif brew list --cask "$package" &> /dev/null; then
        echo "'$package' cask is already installed."
    else
        if [ "$install_type" = "f" ]; then
            echo "Installing '$package' as a formula."
            brew install "$package"
        elif [ "$install_type" = "c" ]; then
            echo "Installing '$package' as a cask."
            brew install --cask "$package"
        else
            echo "Package '$package' is not installed. Install as a formula (F) or as a cask (C)? [F/C/n] "
            read -r choice
            # Lowercase conversion for cross-shell compatibility
            choice=$(echo "$choice" | awk '{print tolower($0)}')
            
            case "$choice" in
                f)
                    brew install "$package"
                    ;;
                c)
                    brew install --cask "$package"
                    ;;
                n)
                    echo "Installation canceled."
                    ;;
                *)
                    echo "Invalid option. Installation canceled."
                    ;;
            esac
        fi
    fi
}


echo "Setting up Alacritty…"
dependency alacritty c
brew tap homebrew/cask-fonts
dependency font-jetbrains-mono-nerd-font c
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/files/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml


echo "Installing NeoVim…"
dependency neovim
mkdir -p ~/.config/nvim/.backup
ln -sf ~/dotfiles/files/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/files/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

echo "Installing Zsh…"
dependency zsh
depencency zsh-autosuggestions
mkdir -p ~/.config/zsh
ln -sf ~/dotfiles/files/zsh/* ~/.config/zsh
ln -sf ~/dotfiles/files/zshrc ~/.zshrc
ln -sf ~/dotfiles/files/zprofile ~/.zprofile
OH_MY_ZSH=$HOME/.oh-my-zsh
if [ -d $OH_MY_ZSH ]; then
  echo "Oh My Zsh is already installed."
else
    # Install Oh My Zsh
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Change default shell to Zsh
    chsh -s $(which zsh)

    echo "Oh My Zsh installed successfully."
fi