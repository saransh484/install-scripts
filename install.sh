#!/bin/bash

# Function to echo red-colored text
echo_red() {
    echo -e "\e[31m$1\e[0m"
}

# Update package lists
echo_red "Updating package lists..."
sudo apt-get update

# Install necessary packages
echo_red "Installing necessary packages..."
sudo apt-get install -y ca-certificates curl

# Create directory for apt keyrings
echo_red "Creating directory for apt keyrings..."
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker GPG key and store it in keyrings directory
echo_red "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Change permissions of the Docker GPG key
echo_red "Changing permissions of Docker GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to apt sources list
echo_red "Adding Docker repository to apt sources list..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package lists again
echo_red "Updating package lists again..."
sudo apt-get update

echo_red "Installing Docker and stuff..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
