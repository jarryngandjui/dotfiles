# Generate SSH key
echo "Generating SSH key..."
read -p "Enter your email: " git_email
read -p "Enter your GitHub username: " git_username
read -p "Enter key name: " keyname
ssh-keygen -t rsa -C "$git_email" -f ~/.ssh/$keyname
echo "SSH key generated successfully."

# Add SSH key to SSH agent
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/$keyname
echo "SSH key has been added to the SSH agent."

# Copy SSH key to clipboard
pbcopy < ~/.ssh/$keyname.pub
echo "SSH key has been copied to the clipboard."
echo "Please open your GitHub account settings, navigate to SSH and GPG keys, and add the copied SSH key."

# Configure local Git user name and email
echo "Configuring local Git user name and email..."
git config --global user.name "$git_username"
git config --global user.email "$git_email"
echo "GitHub SSH key setup and Git configuration completed successfully."
