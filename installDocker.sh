#!/bin/bash


# Update package lists
echo ""
echo ""
echo "Updating package lists..."
sudo apt-get update

# Install necessary packages
echo ""
echo ""
echo "Installing necessary packages..."
sudo apt-get install -y ca-certificates curl

# Create directory for apt keyrings
echo ""
echo ""
echo "Creating directory for apt keyrings..."
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker GPG key and store it in keyrings directory
echo ""
echo ""
echo "Downloading Docker GPG key..."
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Change permissions of the Docker GPG key
echo ""
echo ""
echo "Changing permissions of Docker GPG key..."
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to apt sources list
echo ""
echo ""
echo "Adding Docker repository to apt sources list..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package lists again
echo ""
echo ""
echo "Updating package lists again..."
sudo apt-get update

echo ""
echo ""
echo "Installing Docker and stuff..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


echo ""
echo ""
echo "adding user to docker group...."
sudo usermod -aG docker $USER && newgrp docker

echo ""
echo ""
echo "########### Installed Docker Successfully!! ##########"
echo ""
echo ""
echo ""
