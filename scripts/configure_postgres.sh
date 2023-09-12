!#/bin/bash

# User settings
# https://apple.stackexchange.com/questions/96665/is-it-possible-to-create-a-user-without-a-home-directory
# Check all users unique and primary ids: dscl . -list /Users UniqueID PrimaryGroupID | grep 501
sudo dscl . -create /Users/postgres
sudo dscl . -create /Users/postgres UserShell /bin/zsh
sudo dscl . -create /Users/postgres RealName "PostgreSQL User"
sudo dscl . -create /Users/postgres UniqueID 502
sudo dscl . -create /Users/postgres NFSHomeDirectory /Users/postgres
sudo dscl . -create /Users/postgres Picture /Library/User\ Pictures/Animals/Owl.heic
sudo dscl . -passwd /Users/postgres postgres 
sudo dscl . -append /Groups/staff GroupMembership postgres

# Create postgres group with sudo privileges
sudo dseditgroup -o create postgres
sudo dseditgroup -o edit -a postgres -t user postgres
# In visduo file, add the following line to allow postgres group to 
# run any version psql commands with sudo access without password
# %postgres ALL=(ALL) NOPASSWD: /opt/homebrew/opt/postgresql*/bin/psql



# Create postgres db
sudo -u postgres createdb postgres
