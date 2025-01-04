#!/usr/bin/env bash

# 1. Update and Upgrade
sudo apt update && sudo apt upgrade -y

# 2. Install fish
sudo apt install fish -y

# Set fish as the default shell
chsh -s /usr/bin/fish

# 3. Install tmux
sudo apt install tmux -y

# Create a new tmux session and run the Webuzo installation commands inside it
tmux new-session -d -s mysession <<EOF
sudo apt update && sudo apt upgrade -y
wget -N https://files.webuzo.com/install.sh
chmod 0755 install.sh
./install.sh
EOF

# Optional: Display message for the user
echo "Tmux session 'mysession' has been created. You can attach it using:"
echo "tmux attach -t mysession"
