!#/bin/bash

# User settings
# https://apple.stackexchange.com/questions/96665/is-it-possible-to-create-a-user-without-a-home-directory
# Check all users unique and primary ids: dscl . -list /Users UniqueID PrimaryGroupID | grep 501
sudo dscl . -create /Users/postgres
sudo dscl . -create /Users/postgres UserShell /bin/zsh
sudo dscl . -create /Users/postgres RealName "PostgreSQL User"
sudo dscl . -create /Users/postgres UniqueID 502
sudo dscl . -passwd /Users/postgres postgres 
