#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings

echo "installation de docker"
# Add Docker's official GPG key:
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the docker's repository to Apt sources:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "docker installé"

echo "installation de K3D"
sudo wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | sudo bash
sudo usermod -aG docker $(whoami)
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
echo "K3D installé"
