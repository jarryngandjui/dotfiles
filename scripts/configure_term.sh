#!/bin/bash
create_folder_if_not_exist() {
  local folder_path="$1"

  # Check if the folder already exists
  if [ -d "$folder_path" ]; then
    echo "'$folder_path' already exists."
  else
    # Create the folder
    echo "Creating the folder '$folder_path'..."
    mkdir -p "$folder_path"
    echo "'$folder_path' has been created successfully."
  fi
}

# Create ~/Projects folder
PROJECTS=~/Projects
create_folder_if_not_exist $PROJECTS

# Install ohmyzsh
# Check if Oh My Zsh is already installed
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


# Install OH-MY-ZSH dracula theme
cd $HOME

DRACULA_THEM_FILE=$OH_MY_ZSH/themes/dracula.zsh-theme
DRACULA_THEME_PROJECT=$PROJECTS/dracula
create_folder_if_not_exist $DRACULA_THEME_PROJECT

# Check if the Dracula theme file already exists
if [ -f "$DRACULA_THEM_FILE" ]; then
  echo "The Dracula theme is already installed."
else
    # Download the Dracula theme file
    echo "Downloading the Dracula theme..." 
    git clone https://github.com/dracula/zsh.git $DRACULA_THEME_PROJECT
    ln -s $DRACULA_THEME_PROJECT/dracula.zsh-theme $OH_MY_ZSH/themes/

    sed -i '' 's/ZSH_THEME=.*/ZSH_THEME="dracula"/' "$HOME/.zshrc"

    echo "The Dracula theme has been installed successfully. Please restart your terminal."
fi

# Install Node.js and npm using Homebrew
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Installing Node.js..."
    brew update
    brew install node
else
    echo "Node.js is already installed."
fi

echo "Node.js version:"
node --version
echo "npm version:"
npm --version


