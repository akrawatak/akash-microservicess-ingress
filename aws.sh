#!/bin/bash

set -e

echo "Installing AWS CLI v2..."

# Download the AWS CLI zip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip
unzip -o awscliv2.zip

# Run the installer
sudo ./aws/install

# Verify installation
echo "AWS CLI version:"
aws --version

