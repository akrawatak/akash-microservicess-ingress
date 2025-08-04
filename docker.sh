#!/bin/bash

set -e

echo "Updating system packages..."
sudo apt-get update

echo "Installing required packages..."
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

echo "Adding Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Updating package index..."
sudo apt-get update

echo "Installing Docker Engine..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding current user to docker group (you may need to logout/login)..."
sudo usermod -aG docker $USER

echo "Docker installation complete!"
docker --version
