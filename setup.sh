# #!/bin/bash

# # Make the script executable
# chmod +x gitgo
# chmod +x checkurl.sh

# # Get the absolute path to the script's directory using realpath (macOS and Linux compatible)
# SCRIPT_DIR=$(realpath "$(dirname "$0")")

# echo "///////////////////"
# echo $SCRIPT_DIR
# echo $PATH

# # Check if SCRIPT_DIR is already in the PATH
# if [[ ":$PATH:" != *":$SCRIPT_DIR:"* ]]; then
#     # Append the export PATH line to ~/.zshrc
#     echo 'export PATH="$PATH:'"$SCRIPT_DIR"'"' >>~/.zshrc

#     # Source ~/.zshrc to apply changes to the current shell session
#     source ~/.zshrc

#     source ./gitgologger.sh "Added $SCRIPT_DIR to your PATH in ~/.zshrc"
# else
#     source ./gitgologger.sh "$SCRIPT_DIR already exists in path"
# fi

# # Create the .gitgo_repo_url file if it doesn't exist
# touch .gitgo_repo_url

# url=$(source checkurl.sh)
