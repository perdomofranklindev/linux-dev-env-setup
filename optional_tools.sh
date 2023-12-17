#!/bin/bash

# Install Insomnia
function install_insomnia() {
    echo -e "Installing Insomnia 🌑"
    sudo snap install insomnia
}

# Install Onlyoffice
function install_onlyoffice() {
    echo -e "Installing Onlyoffice 📃"
    sudo snap install onlyoffice-desktopeditors
}

# Install Git
function install_git() {
    echo -e "Installing Git 👨‍💻"
    sleep 2s
    yes | sudo apt-get install git
}

# Install Docker
function install_docker() {
    echo -e "Installing Docker 🐳"
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
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt-get update
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    sudo apt-get update
    yes | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

    sudo usermod -a -G docker $USER
    sudo chmod 777 /var/run/docker.sock

    # Install Docker Compose.
    install_docker_compose
}

# Install Docker Compose
function install_docker_compose() {
    echo -e "Installing Docker Compose 🐳"
    sleep 2s
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
    sudo chmod +x /usr/bin/docker-compose
}

# Google Chrome
function install_chrome() {
    echo -e "🔎 Installing Google Chrome..."
    sleep 2s
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install google-chrome-stable
}

# Visual Studio Code
function install_visualstudio() {
    echo -e "💻 Installing Visual Studio Code..."
    sleep 2s
    sudo snap install --classic code
}

# Android Studio
function install_android_studio() {
    echo -e "📱 Installing Android Studio..."
    sleep 2s
    yes | sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
    sudo snap install android-studio --classic
}

# Spotify
function install_spotify() {
    echo -e "🎧 Installing Spotify..."
    sleep 2s
    sudo snap install spotify
}

# Slack
function install_slack() {
    echo -e "🎙 Installing Slack..."
    sleep 2s
    sudo snap install slack --classic
}

# Discord
function install_discord() {
    echo -e "💬 Installing Discord..."
    sleep 2s
    sudo snap install discord
}

function install_omf() {
    # Install Oh my fish
    echo -e "Installing Oh my fish 🎨"
    sleep 2s
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install >install
    echo -e "Curl oh my fish installation done!"
    ( fish install --path=~/.local/share/omf --config=~/.config/omf ) & wait $!
    echo -e "\n👌 You can configure your shell theme with https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#agnoster"
    echo -e "It's super easy to use it!"
}

# Fish terminal
function install_fish_terminal() {
    echo -e "🐟 Fish Terminal"
    sleep 2s
    echo -ne '\n' | sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    yes | sudo apt install fish

    # Fish as default terminal
    echo -e "configure the default terminal 🔨"
    sleep 2s
    whoami ALL=(ALL:ALL) NOPASSWD: /usr/bin/tee -a /etc/shells
    echo /usr/local/bin/fish | tee -a /etc/shells
    echo $PASSWORD | chsh -s $(which fish) # To revert => chsh -s $(which bash)

    # This for prevent a premature exit
    trap 'echo "Finished installing fish!"' EXIT
    output=$(install_omf 2>&1)
    if [[ $? -eq 0 ]]; then
      echo "Installation successful!"
    else
      echo "Installation failed!"
      echo "$output"
    fi

    # Fish Node Version Manager
    echo -e "Installing Node Version Manager 🍃"
    sleep 2s
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    omf install nvm
}

# OBS
function install_obs() {
    echo -e "📹 OBS"
    sleep 2s
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt install ffmpeg obs-studio
}

# PgAdmin
function install_pgadmin() {
    echo -e "📊 PgAdmin"
    sleep 2s
    curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
    sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
    sudo apt install pgadmin4
}
