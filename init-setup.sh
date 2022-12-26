#!/bin/bash

# Set your password here
PASSWORD=$1

if [ -z "$PASSWORD" ]; then
  echo "Please provide a password"
  exit 1
fi

echo "💻 Setting up the environment..."
sleep 2s

# Update system
echo "🔄 Updating system..."
sleep 2s
echo $PASSWORD | sudo -S apt-get update
echo $PASSWORD | sudo -S apt-get upgrade
echo "✔️ System updated successfully!"

# Snap
echo "Snap 🐦"
sleep 2s
sudo apt install snapd

# Git
echo -e "Git 👨‍💻"
sleep 2s
sudo apt-get install git

# Docker
echo -e "Docker 🐳"
sleep 2s
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

echo $PASSWORD | sudo -S apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Docker Compose.
echo -e "Docker Compose 🐳"
sleep 2s
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

# # Google Chrome
# echo -e "🔎 Installing Google Chrome..."
# sleep 2s
# yes | sudo apt-get install libxss1 libappindicator1 libindicator7
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb
# rm -rf google-chrome-stable_current_amd64.deb

# # Visual Studio Code
# echo -e "💻 Installing Visual Studio Code..."
# sleep 2s
# sudo snap install --classic code
 
# # Android Studio
# echo -e "📱 Installing Android Studio..."
# sleep 2s
# yes | sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
# sudo snap install android-studio --classic

# # Spotify
# echo -e "🎧 Installing Spotify..."
# sleep 2s
# sudo snap install spotify

# # NGROK
# echo -e "🔗 Installing NGROK..."
# sleep 2s
# sudo apt-get install zip unzip
# sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
# sudo unzip ngrok-stable-linux-amd64.zip
# sudo chmod +x ngrok
# sudo mv ngrok /usr/bin/
# rm -rf ngrok-stable-linux-amd64.zip

# # Slack
# echo -e "🎙 Installing Slack..."
# sleep 2s
# sudo snap install slack --classic

# # Discord
# echo -e "💬 Installing Discord..."
# sleep 2s
# sudo snap install discord