#!/bin/bash

# Enable ssh password authentication
sudo sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
sudo systemctl reload sshd

# Set Root password
echo "[TASK 2] Set root password"
sudo echo -e "sparkadmin\nsparkadmin" | passwd root >/dev/null 2>&1