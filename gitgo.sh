#!/bin/bash

if [ -z "$GITGO_GITHUB_REPO_URL" ]; then
  # If not set, prompt the user to provide a GitHub repository URL
  read -p "Enter the GitHub repository URL: " user_url
  # Save the URL as an environment variable
  export GITGO_GITHUB_REPO_URL="$user_url"
  echo "GitHub repository URL set as: $GITGO_GITHUB_REPO_URL"
fi


# Get the argument from the command line
commit_msg=$1

url="https://github.com/ayeagle"

# Execute the git commands
git add --all
git commit --all -m"$commit_msg"
git push origin HEAD


open "$url"