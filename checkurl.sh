# #!/bin/bash

# # Function to check and manage the repository URL
# check_url() {

#   if [ ! -f .gitgo_repo_url ]; then
#     touch .gitgo_repo_url
#   fi
#   # Load the URL from the .gitgo_repo_url file in the current directory
#   GITGO_GITHUB_REPO_URL=$(cat .gitgo_repo_url)

#   if [ -z "$GITGO_GITHUB_REPO_URL" ]; then
#     # If not set, prompt the user to provide a GitHub repository URL
#     read -p "Enter the GitHub repository URL: " user_url
#     # Save the URL to the .gitgo_repo_url file in the current directory
#     echo "$user_url" >.gitgo_repo_url
#     # Save the URL as an environment variable
#     export GITGO_GITHUB_REPO_URL="$user_url"
#     # echo "GitHub repository URL set as: $GITGO_GITHUB_REPO_URL"
#   fi

#   # Return the URL
#   echo "$GITGO_GITHUB_REPO_URL"
# }

# # Invoke the function to check and manage the repository URL
# url=$(check_url)

# # Print the URL for testing (you can remove this line)
# # echo "GitHub repository URL: $url"

# # Return the URL to the caller (in this case, the 'gitgo' or 'setup.sh' script)
# echo "$url"
