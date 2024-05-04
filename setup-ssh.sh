#!/bin/bash

echo "Install OpenSSH server"
sudo apt update && sudo apt install openssh-server -y

echo "Start SSH service"
sudo systemctl start ssh

echo "Set up SSH connection"

echo 'root:$SSH_PASSWD' | sudo chpasswd
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo service ssh restart

echo "Check SSH service status"
systemctl status ssh
