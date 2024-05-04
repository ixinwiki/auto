#!/bin/bash

echo "Install OpenSSH server"
sudo apt update && sudo apt install openssh-server -y

echo "Start SSH service"
sudo systemctl start ssh

echo "Set up SSH connection using public key from environment variable"

# 从环境变量中获取公钥
PUBLIC_KEY=$SSH_PUBLIC_KEY

# 将公钥添加到授权密钥中
echo "$PUBLIC_KEY" >> /root/.ssh/authorized_keys
echo 'root:$SSH_PASSWD' | sudo chpasswd

sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo service ssh restart

echo "Check SSH service status"
systemctl status ssh
