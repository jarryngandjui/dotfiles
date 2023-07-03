#!/bin/bash

echo "Installing Chrome..."
if [ -x "$(command -v google-chrome-stable)" ]; then
  echo "Chrome is already installed."
else
  brew cask install google-chrome
  echo "Chrome has been installed successfully."
fi

echo "Installing Docker..."
if [ -x "$(command -v docker)" ]; then
  echo "Docker is already installed."
else
  brew install docker
  echo "Docker has been installed successfully."
fi


echo "Installing VSCode..."
if [ -x "$(command -v code)" ]; then
  echo "VSCode is already installed."
else
  brew cask install visual-studio-code
  echo "VSCode has been installed successfully."
fi


echo "Installing Notion..."
if [ -x "$(command -v notion)" ]; then
  echo "Notion is already installed."
else
  brew cask install notion
  echo "Notion has been installed successfully."
fi

echo "Installing Postman..."
if [ -x "$(command -v postman)" ]; then
  echo "Postman is already installed."
else
  brew install --cask postman
  echo "Postman has been installed successfully."
fi
