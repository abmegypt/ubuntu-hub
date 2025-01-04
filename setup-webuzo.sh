#!/usr/bin/env bash

# 1. Update and Upgrade
sudo apt update && sudo apt upgrade -y

# 2. Install fish
sudo apt install fish -y

# Set fish as the default shell
chsh -s /usr/bin/fish
echo "Fish shell installed and set as default."

# # Switch to fish (interactive session)
# exec fish

# 3. Install tmux
sudo apt install tmux -y

# Create a new tmux session and pass the Webuzo installation commands to it
tmux new-session -d -s mysession bash -c "
    wget -N https://files.webuzo.com/install.sh;
    chmod 0755 install.sh;
    ./install.sh;
    exec bash
"

# # Notify user of the created tmux session
# echo -e "\033[1;32mTmux session 'mysession' has been created. Use the following command to attach:\033[0m"
# echo -e "\033[1;34mtmux attach -t mysession\033[0m"

# Attach to the tmux session directly
tmux attach -t mysession
