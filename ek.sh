#!/bin/bash

# Download eksctl tar.gz and extract to /tmp
echo "Downloading eksctl..."
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp

# Move binary to /usr/local/bin
echo "Installing eksctl to /usr/local/bin..."
sudo mv /tmp/eksctl /usr/local/bin/

# Make executable
sudo chmod +x /usr/local/bin/eksctl

# Verify
echo "Verifying installation..."
eksctl versio
