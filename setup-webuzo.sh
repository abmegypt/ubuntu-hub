#!/usr/bin/env bash

# 1. Update and Upgrade
sudo apt update && sudo apt upgrade -y

# 2. Install fish
sudo apt install fish -y

# Set fish as the default shell
chsh -s /usr/bin/fish
echo "Fish shell installed and set as default. You will need to log out and log back in for this to take effect."

# 3. Install tmux
sudo apt install tmux -y

# Create a new tmux session and pass the Webuzo installation commands to it
tmux new-session -d -s mysession bash -c "
    sudo apt update && sudo apt upgrade -y;
    wget -N https://files.webuzo.com/install.sh;
    chmod 0755 install.sh;
    ./install.sh;
    exec bash
"

# Notify user of the created tmux session
echo "Tmux session 'mysession' has been created. Use the following command to attach:"
echo "tmux attach -t mysession"
