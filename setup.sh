# chmod +x gitgo.sh

# # Get the absolute path to the script's directory
# SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# echo "Abs path recorded: $SCRIPT_DIR"


# nano ~/.zshrc

# # Append the export PATH line to your script's file
# echo 'export PATH="$PATH:'"$SCRIPT_DIR"'"' >> "$SCRIPT_DIR/gitgo.sh"

# source ~/.zshrc  # For Bash


#!/bin/bash

# Make the script executable
chmod +x gitgo
chmod +x checkurl.sh

# Get the absolute path to the script's directory using realpath (macOS and Linux compatible)
SCRIPT_DIR=$(realpath "$(dirname "$0")")

echo "Abs path recorded: $SCRIPT_DIR"

# Append the export PATH line to ~/.zshrc
echo 'export PATH="$PATH:'"$SCRIPT_DIR"'"' >> ~/.zshrc

# Source ~/.zshrc to apply changes to the current shell session
source ~/.zshrc

echo "Added $SCRIPT_DIR to your PATH in ~/.zshrc"
touch .gitgo_repo_url


url=$(source checkurl.sh)
