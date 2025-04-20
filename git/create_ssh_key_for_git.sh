#!/bin/bash

# Check if a key name and email are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <key_name> <email>"
  echo "Please provide a key name and an email address as arguments."
  exit 1
fi

# Variables for the key name and email
KEY_NAME=$1
EMAIL=$2

# Generate SSH key
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519_$KEY_NAME

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add SSH key to the agent
ssh-add ~/.ssh/id_ed25519_$KEY_NAME

# Ensure the .ssh directory and config file exist
mkdir -p ~/.ssh
touch ~/.ssh/config

# Check if the configuration already exists
if ! grep -q "Host github.com-$KEY_NAME" ~/.ssh/config; then
  # Append configuration to the SSH config file
  cat <<EOL >> ~/.ssh/config
Host github.com-$KEY_NAME
  HostName github.com
  User git
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519_$KEY_NAME
EOL
else
  echo "Configuration for 'Host github.com-$KEY_NAME' already exists in ~/.ssh/config"
fi

# Kill the SSH agent
eval "$(ssh-agent -k)"

# Reminder message
echo "To connect to a repository using this SSH key, use the alias 'github.com-$KEY_NAME'."
echo "For example, you can clone a repository like this:"
echo "git clone git@github.com-$KEY_NAME:username/repository.git"
echo "You can find your public key at ~/.ssh/id_ed25519_$KEY_NAME.pub"
