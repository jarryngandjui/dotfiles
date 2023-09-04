#!/bin/bash

# Generate SSH key
echo "Generating SSH key..."
ssh-keygen -t rsa -C "jarryngandjui@gmail.com" -f ~/.ssh/id_github

# Start SSH agent
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"

# Add SSH key to SSH agent
echo "Adding SSH key to SSH agent..."
ssh-add -K ~/.ssh/id_ed25519

# Copy SSH key to clipboard
echo "Copying SSH key to clipboard..."
pbcopy < ~/.ssh/id_ed25519.pub
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
