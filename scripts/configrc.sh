#!/bin/bash

ALIAS=~/Projects/Notes/scripts/alias.sh
VARS=~/Projects/Notes/scripts/vars.sh
SECRETS=~/Projects/Notes/scripts/secrets.sh

chmod +x $ALIAS
chmod +x $VARS
chmod +x $SECRETS

source "$ALIAS"
source "$VARS"
chmod +x $SECRETS