#!/bin/bash

# Pleae run the configure_git.sh script first
# It requires the SSH key to be added to the GitHub account

# Define variables
PROJECTS=~/Projects
NOTES=$PROJECTS/Notes/
SCRIPTS=$NOTES/scripts

# Define scripts
APPS=$SCRIPTS/install_apps.sh
TERM=$SCRIPTS/configure_term.sh

# Export variables
export PROJECTS
export NOTES
export SCRIPTS

# Make the scripts executable 
chmod +x $APPS
chmod +x $TERM

APPS
TERM