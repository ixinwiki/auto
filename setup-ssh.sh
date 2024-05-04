#!/bin/bash

# Install OpenSSH server
sudo apt update && sudo apt install openssh-server -y

# Start SSH service
sudo systemctl start ssh

# Set up SSH connection
echo 'root:$1' | sudo chpasswd
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo service ssh restart

# Check SSH service status
systemctl status ssh
