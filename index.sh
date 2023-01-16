#!/bin/bash

# Author: Franklin Perdomo <perdomofranklindev@gmail.com>

# ====================================
# Previous setup
# ====================================

# Set your password here
PASSWORD=$1

if [ -z "$PASSWORD" ]; then
  echo "Please provide a password"
  exit 1
fi

echo "💻 Setting up the environment..."

# Update system
echo "🔄 Updating system..."
echo $PASSWORD | sudo -S apt-get update
echo $PASSWORD | sudo -S apt-get upgrade
echo "✔️ System updated successfully!"

# Curl
echo "Installing curl 🌐"
sleep 2s
sudo apt-get install curl

# Snap
echo "Snap 🐦"
sleep 2s
sudo apt install snapd

echo -e "\n"

# ====================================
# Show the options
# ====================================

# UI
source menu.sh

for item in "${UI_WIDGET_RC[@]}"
do
    case $item in
        0)
        # Insomnia
        echo -e "Insomnia 🌑"
        sudo snap install insomnia
        ;;
        1)
        # Onlyoffice
        echo -e "Onlyoffice 📃"
        sudo snap install onlyoffice-desktopeditors
        ;;
        2)
        # Git
        echo -e "Git 👨‍💻"
        sleep 2s
        yes | sudo apt-get install git
        ;;
        3)
        # Docker
        echo -e "Docker 🐳"
        sleep 2s
        echo $PASSWORD | sudo snap install docker 
        echo $PASSWORD | sudo apt update
        echo $PASSWORD | sudo apt install apt-transport-https ca-certificates curl software-properties-common

        sudo apt-get remove docker docker-engine docker.io containerd runc
        sudo apt-get update
        yes | sudo apt-get install \
            ca-certificates \
            gnupg \
            lsb-release
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo chmod a+r /etc/apt/keyrings/docker.gpg
        sudo apt-get update
        yes | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

        sudo usermod -a -G docker $USER
        sudo chmod 777 /var/run/docker.sock

        # Docker Compose.
        echo -e "Docker Compose 🐳"
        sleep 2s
        sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
        sudo chmod +x /usr/bin/docker-compose
        ;;
        4)
        # Google Chrome
        echo -e "🔎 Installing Google Chrome..."
        sleep 2s
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add 
        echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
        sudo apt-get update 
        sudo apt-get install google-chrome-stable
        ;;
        5)
        # Visual Studio Code
        echo -e "💻 Installing Visual Studio Code..."
        sleep 2s
        sudo snap install --classic code
        ;;
        6)
        # Android Studio
        echo -e "📱 Installing Android Studio..."
        sleep 2s
        yes | sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
        sudo snap install android-studio --classic
        ;;
        7)
        # Spotify
        echo -e "🎧 Installing Spotify..."
        sleep 2s
        sudo snap install spotify
        ;;
        8)
        # Slack
        echo -e "🎙 Installing Slack..."
        sleep 2s
        sudo snap install slack --classic
        ;;
        9)
        # Discord
        echo -e "💬 Installing Discord..."
        sleep 2s
        sudo snap install discord
        ;;
        9)
        # Fish terminal
        echo -e "🐟 Fish Terminal"
        sleep 2s
        echo -ne '\n' | sudo apt-add-repository ppa:fish-shell/release-3
        sudo apt update
        yes | sudo apt install fish

        # Fish as default terminal
        echo -e "configure the default terminal 🔨"
        sleep 2s
        echo /usr/local/bin/fish | sudo tee -a /etc/shells
        echo $PASSWORD | chsh -s $(which fish) # To revert => chsh -s $(which bash)

        # Fish Node Version Manager
        echo -e "Installing Node Version Manager 🍃"
        sleep 2s
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        fisher install jorgebucaran/nvm.fish

        # Install Oh my fish
        echo -e "Installing Oh my fish 🎨"
        sleep 2s
        curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
        fish install --path=~/.local/share/omf --config=~/.config/omf
        echo -e "\n👌 You can configure your shell theme with https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#agnoster"
        echo -e "It's super easy to use it!"
        ;;
    esac
done

echo -e "Please restart your system..."