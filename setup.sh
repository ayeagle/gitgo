chmod +x gitgo.sh

# Get the absolute path to the script's directory
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo "Abs path recorded: $SCRIPT_DIR"


nano ~/.bashrc

# Append the export PATH line to your script's file
echo 'export PATH="$PATH:'"$SCRIPT_DIR"'"' >> "$SCRIPT_DIR/gitgo.sh"

source ~/.bashrc  # For Bash
