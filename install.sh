#!/bin/bash

# Define variables
REPO_URL="https://github.com/gndps/dot_bash_files.git"
TARGET_DIR="$HOME/.bash_files"
BASH_PROFILE="$HOME/.bash_profile"
BASHRC="$HOME/.bashrc"
BFCLI_SOURCE="source $TARGET_DIR/bfcli"

# Function to create a timestamp
timestamp() {
    date +"%Y%m%d%H%M%S"
}

# Backup existing .bash_files if it exists
if [ -d "$TARGET_DIR" ]; then
    TIMESTAMP=$(timestamp)
    BACKUP_DIR="$HOME/.bash_files_bak_$TIMESTAMP"
    echo "Backing up existing .bash_files to $BACKUP_DIR"
    mv "$TARGET_DIR" "$BACKUP_DIR"
fi

# Clone the repository
echo "Cloning repository..."
git clone $REPO_URL $TARGET_DIR

# Add source command to .bash_profile if not already present
if ! grep -Fxq "$BFCLI_SOURCE" $BASH_PROFILE; then
    echo "$BFCLI_SOURCE" >> $BASH_PROFILE
    echo "Added bfcli source to $BASH_PROFILE"
fi

# Add source command to .bashrc if not already present
if ! grep -Fxq "$BFCLI_SOURCE" $BASHRC; then
    echo "$BFCLI_SOURCE" >> $BASHRC
    echo "Added bfcli source to $BASHRC"
fi

# # Source the bfcli command in the current session
# source $TARGET_DIR/bfcli

# # Run bfcli init default
# echo "Initializing bfcli with default config..."
# source $HOME/.bash_profile
# bfcli init default
# exec $SHELL

# echo "Installation complete!"
# echo
# echo "Now you can initialize os specific or machine specific profiles"
# echo "Run following to list profiles:"
# echo "bfcli init"
# echo
