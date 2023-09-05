#!/bin/bash

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


echo "Installing VSCode..."
if [ -x "$(command -v code)" ]; then
  echo "VSCode is already installed."
else
  brew install --cask visual-studio-code
  echo "VSCode has been installed successfully."
fi


echo "Installing Notion..."
if [ -x "$(command -v notion)" ]; then
  echo "Notion is already installed."
else
  brew install --cask notion
  echo "Notion has been installed successfully."
fi

echo "Installing Postman..."
if [ -x "$(command -v postman)" ]; then
  echo "Postman is already installed."
else
  brew install --cask postman
  echo "Postman has been installed successfully."
fi
