#!/bin/bash

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


echo "Installing Homebrew..."
# Check if Homebrew is installed
if command -v brew &> /dev/null; then
    echo "Homebrew is already installed."
else
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Homebrew installation complete."
fi

echo "Setting up Alacritty…"
dependency alacritty c
brew tap homebrew/cask-fonts
dependency font-jetbrains-mono-nerd-font c
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/files/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml


echo "Installing NeoVim…"
dependency neovim f
mkdir -p ~/.config/nvim/.backup
ln -sf ~/dotfiles/files/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/files/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

echo "Installing up RipGrep…"
# Handle skipping .gitignore files on search
dependency ripgrep f

echo "Installing up n…"
# Node version manager .nvmrc files
dependency n f

echo "Installing Zsh…"
dependency zsh f
OH_MY_ZSH=$HOME/.oh-my-zsh
OH_MY_ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [ -d $OH_MY_ZSH ]; then
  echo "Oh My Zsh is already installed."
else
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Change default shell to Zsh
    chsh -s $(which zsh)
    echo "Oh My Zsh installed successfully."
fi
DRACULA_THEME_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/dracula"
if [ ! -d "$DRACULA_THEME_DIR" ]; then
    echo "Dracula theme not found. Installing..."
    git clone https://github.com/dracula/zsh.git "$DRACULA_THEME_DIR"
    # Create a symlink for the theme to be recognized by Oh My Zsh
    ln -s "${DRACULA_THEME_DIR}/dracula.zsh-theme" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/dracula.zsh-theme"
    echo "Dracula theme installed and set successfully."
else
    echo "Dracula theme is already installed."
fi
ZSH_AUTOSUGGESTIONS_DIR="$OH_MY_ZSH_CUSTOM/plugins/zsh-autosuggestions"
if [ ! -d "$OH_MY_ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AUTOSUGGESTIONS_DIR"
else
    echo "zsh-autosuggestions is already installed."
fi

echo "Loading zsh profile and scripts..."
mkdir -p ~/.config/zsh
ln -sf ~/dotfiles/files/zsh/* ~/.config/zsh
ln -sf ~/dotfiles/files/zshrc ~/.zshrc
ln -sf ~/dotfiles/files/zprofile ~/.zprofile
echo "Loaded zsh profile and scripts."


