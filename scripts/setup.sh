#!/bin/bash

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

# Install homebrew
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing now..."
    
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/maestro/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Homebrew installed successfully!"
    else
        echo "Failed to install Homebrew."
        exit 1
    fi
else
    echo "Homebrew is already installed."
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


echo "Installing Python..."
if brew list python3 &>/dev/null; then
    echo "Python 3 is already installed."
else
  brew install python3
  if [ $? -eq 0 ]; then
        echo "Python 3 installed successfully."
  else
      echo "Error: Python 3 installation failed."
  fi
fi

echo "Installing Chrome..."
if [ -x "$(command -v google-chrome-stable)" ]; then
  echo "Chrome is already installed."
else
  brew install --cask google-chrome
  echo "Chrome has been installed successfully."
fi

echo "Installing Docker..."
if [ -x "$(command -v docker)" ]; then
  echo "Docker is already installed."
else
  brew install docker
  echo "Docker has been installed successfully."
fi
docker login

echo "Installing Postman..."
if [ -x "$(command -v postman)" ]; then
  echo "Postman is already installed."
else
  brew install --cask postman
  echo "Postman has been installed successfully."
fi


# Generate SSH key
echo "Generating SSH key..."
ssh-keygen -t rsa -C "jarryngandjui@gmail.com" -f ~/.ssh/id_github

# Start SSH agent
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"

# Add SSH key to SSH agent
echo "Adding SSH key to SSH agent..."
ssh-add --apple-use-keychain ~/.ssh/id_github

# Copy SSH key to clipboard
echo "Copying SSH key to clipboard..."
pbcopy < ~/.ssh/id_github.pub
echo "SSH key has been copied to the clipboard."

# Prompt user to add SSH key to GitHub account
echo "Please open your GitHub account settings, navigate to SSH and GPG keys, and add the copied SSH key."
echo "Press Enter when you have added the SSH key to your GitHub account."
read

# Configure local Git user name and email
echo "Configuring local Git user name and email..."
echo "Enter your Git user name:"
read git_username
echo "Enter your Git email:"
read git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo "GitHub SSH key setup and Git configuration completed successfully."
