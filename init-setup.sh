#!/bin/bash

echo "Setting up the environment..."
sleep 2s

# Update system
echo "Updating system..."
sudo apt-get update
sudo apt-get upgrade

# Git
sudo apt-get install git

# Install docker ubuntu
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Linux command to install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Visual studio code
sudo snap install --classic code
 
# Linux command to install Android Studio
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
wget https://dl.google.com/dl/android/studio/ide-zips/
unzip android-studio-ide-173.4859392-linux.zip
sudo mv android-studio /opt/
sudo ln -s /opt/android-studio/bin/studio.sh /usr/bin/studio
 