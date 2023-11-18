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
chmod +x gitgo.sh

# Get the absolute path to the script's directory using realpath (macOS and Linux compatible)
SCRIPT_DIR=$(realpath "$(dirname "$0")")

echo "Abs path recorded: $SCRIPT_DIR"

# Append the export PATH line to ~/.zshrc
echo 'export PATH="$PATH:'"$SCRIPT_DIR"'"' >> ~/.zshrc

# Source ~/.zshrc to apply changes to the current shell session
source ~/.zshrc

echo "Added $SCRIPT_DIR to your PATH in ~/.zshrc"

if [ -z "$GITGO_GITHUB_REPO_URL" ]; then
  # If not set, prompt the user to provide a GitHub repository URL
  read -p "Enter the GitHub repository URL: " user_url
  # Save the URL to a file
  echo "$user_url" > ~/.gitgo_repo_url
  # Save the URL as an environment variable
  export GITGO_GITHUB_REPO_URL="$user_url"
  echo "GitHub repository URL set as: $GITGO_GITHUB_REPO_URL"
fi

