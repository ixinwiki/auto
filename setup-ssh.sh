#!/bin/bash

echo "Install OpenSSH server"
apt update && apt install openssh-server -y

echo "Start SSH service"
systemctl start ssh

echo "Set up SSH connection using public key from environment variable"

# 从环境变量中获取公钥
PUBLIC_KEY=$SSH_PUBLIC_KEY

# 将公钥添加到授权密钥中
echo "$PUBLIC_KEY" >> /root/.ssh/authorized_keys
echo 'root:$SSH_PASSWD' | chpasswd

sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
service ssh restart

echo "Check SSH service status"
systemctl status ssh
