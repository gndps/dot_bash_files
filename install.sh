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
echo
echo "== Cloning repository... =="
echo
git clone $REPO_URL $TARGET_DIR

PREREQ="$TARGET_DIR/prerequisites"
echo
echo "== Installing Prerequisites =="
echo
chmod +x $PREREQ && $PREREQ && \
echo "SUCCESS: Initialized prerequisites"

echo
echo "== Adding to bash_profile =="
echo
# Add source command to .bash_profile if not already present
if ! grep -Fxq "$BFCLI_SOURCE" $BASH_PROFILE; then
    echo "$BFCLI_SOURCE" >> $BASH_PROFILE
    echo "Added bfcli source to $BASH_PROFILE"
fi

echo
echo "== Adding to bash_rc =="
echo
# Add source command to .bashrc if not already present
if ! grep -Fxq "$BFCLI_SOURCE" $BASHRC; then
    echo "$BFCLI_SOURCE" >> $BASHRC
    echo "Added bfcli source to $BASHRC"
fi

echo
echo "================================="
echo "Bash files installed successfully"
echo "================================="
echo