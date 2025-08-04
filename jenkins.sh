#!/bin/bash
# 1. Install Java
sudo apt update
sudo apt install openjdk-17-jdk -y

# 2. Add Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# 3. Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# 4. Update and install Jenkins
sudo apt update
sudo apt install jenkins -y

# 5. Start and enable the service
sudo systemctl start jenkins
sudo systemctl enable jenkins


