#!/bin/bash

# Define variables
PROJECTS=~/Projects
NOTES=$PROJECTS/Notes/
SCRIPTS=$NOTES/scripts

# Export variables
export PROJECTS
export NOTES
export SCRIPTS

alias notes="cd $NOTES"
alias scripts="cd $SCRIPTS"
alias projects="cd $PROJECTS"
