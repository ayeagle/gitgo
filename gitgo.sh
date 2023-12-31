reboot_message=$(
  cat <<EOF
\n\n
*******************************************************
///////////////////////////////////////////////////////
\nPlease restart your terminal to apply changes
                   OR
run the following to apply changes: $ \033[92msource ~/.zshrc\033[0m
\n///////////////////////////////////////////////////////
*******************************************************
\n\n
EOF
)

help_message=$(
  cat <<EOF

*******************************************************
///////////////////////////////////////////////////////

Gitgo is a small set of functions to perform the following tasks in one command:
-- Add all changes to a commit
-- Commit those changes with a message
-- Open your GitHub repo for review or merging

All commands start with "gitgo" followed by the following arguments:
-- No arguments will open your GitHub repo
-- \033[92m"commit message"\033[0m commits all changes with your message
-- \033[92mclearurl\033[0m removes your linked repo
-- \033[92mcurrurl\033[0m shows the currently linked repo
-- \033[92msetup\033[0m sets up your environment

Hope this helps! Dont break anything 

///////////////////////////////////////////////////////
*******************************************************

EOF
)

gg_log() {
  echo "GITGO_LOGS: $1"
}

clear_repo_url() {
  gg_log "Clearing locally set GitHub repository URL..."
  unset GITGO_GITHUB_REPO_URL
  rm -f .gitgo_repo_url
}

show_curr_url() {
  gg_log "Current repo set as: $(cat .gitgo_repo_url)"
}

show_help() {
  gg_log "$help_message"
}

check_url() {
  if [ ! -f .gitgo_repo_url ]; then
    touch .gitgo_repo_url
  fi

  GITGO_GITHUB_REPO_URL=$(cat .gitgo_repo_url)

  if [ -z "$GITGO_GITHUB_REPO_URL" ]; then
    read -p "Enter the GitHub repository URL: " user_url
    echo "$user_url" >.gitgo_repo_url
    export GITGO_GITHUB_REPO_URL="$user_url"
  fi

  echo "$GITGO_GITHUB_REPO_URL"
}

setup() {
  chmod +x gitgo
  SCRIPT_DIR=$(realpath "$(dirname "$0")")

  if [[ ":$PATH:" != *":$SCRIPT_DIR:"* ]]; then
    echo 'export PATH="$PATH:'"$SCRIPT_DIR"'"' >>~/.zshrc
    source ~/.zshrc
    gg_log "Added $SCRIPT_DIR to your PATH in ~/.zshrc"
    gg_log "$reboot_message"
  else
    gg_log "$SCRIPT_DIR already exists in path. Nothing to do..."
  fi

  touch .gitgo_repo_url
  url=$(source checkurl.sh)
}

go_go_power_ranger() {
  url=$(check_url)
  gg_log "this is the returned URL by gitgo: $url"
  commit_msg=$@

  git add --all
  git commit --all -m"$commit_msg"
  git push origin HEAD

  open "$url"
}

if [ "$#" -eq 0 ]; then
  gg_log "Have fun!"
  url=$(check_url)
  open "$url"
elif [ "$#" -gt 1 ]; then
  gg_log "$(tput setaf 1)Too many arguments!$(tput sgr0) Enter 'gitgo help' for more info"
  exit 0
elif [ "$1" == "clearurl" ]; then
  clear_repo_url
  exit 0
elif [ "$1" == "currurl" ]; then
  show_curr_url
  exit 0
elif [ "$1" == "setup" ]; then
  setup
  exit 0
elif [ "$1" == "help" ]; then
  show_help
  exit 0
elif [ -n "$1" ]; then
  if [ "$#" -eq 1 ] && [[ ! "$1" =~ " " ]]; then
    read -p "Are you sure you want this to be your commit message?

     $1

     (Y/N): " response
    response=$(echo "$response" | tr '[:lower:]' '[:upper:]')

    if [ "$response" == "Y" ]; then
      go_go_power_ranger $@
      exit 0
    else
      gg_log "Ok well then bruh that makes no sense... enter 'gitgo help' for more info"
      exit 1
    fi
  else
    go_go_power_ranger $@
    exit 0
  fi
fi
