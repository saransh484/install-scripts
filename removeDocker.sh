#!/bin/bash

echo ""
echo ""
echo "Removing Docker and its components......"
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras -y

echo ""
echo ""
echo "Removing Directories....."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

echo "####### Removed Docker Successfully!! #######"

