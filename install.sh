#!/bin/bash

# Just making sure
mkdir -p ~/.config

function dependency {
    if brew list --formula $1 &> /dev/null; then
        echo "'$1' formula is already installed."
    elif brew list --cask $1 &> /dev/null; then
        echo "'$1' cask is already installed."
    else
        echo "Package '$1' is not installed. Install as a formula (F) or as a cask (C)? [F/C/n] "
        read choice
        case "${choice:l}" in  # Lowercase conversion for zsh
            f)
                brew install $1
                ;;
            c)
                brew install --cask $1
                ;;
            n)
                echo "Installation canceled."
                ;;
            *)
                echo "Invalid option. Installation canceled."
                ;;
        esac
    fi
}


echo "Setting up Alacritty…"
dependency alacritty
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/files/alacritty.toml ~/.config/alacritty/alacritty.toml


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