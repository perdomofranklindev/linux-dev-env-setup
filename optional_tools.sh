#!/bin/bash

# Install Insomnia
function install_insomnium() {
    echo -e "Installing Insomnium 🌑"
    sudo wget https://github.com/ArchGPT/insomnium/releases/download/core%400.2.3-a/Insomnium.Core-0.2.3-a.deb
    sudo dpkg -i Insomnium.Core-0.2.3-a.deb
    sudo rm -rf Insomnium.Core-0.2.3-a.deb
}

# Install Onlyoffice
function install_onlyoffice() {
    echo -e "Installing Onlyoffice 📃"
    sudo snap install onlyoffice-desktopeditors
}

# Install Docker
function install_docker() {
    echo -e "Installing Docker 🐳"
    sleep 2s
    echo $password | sudo snap install docker
    echo $password | sudo apt update
    echo $password | sudo apt install apt-transport-https ca-certificates curl software-properties-common

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
    sudo mkdir -p /etc/apt/keyrings
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor --yes -o /etc/apt/keyrings/google-chrome.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install google-chrome-stable -y
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

# Install Warp
function install_warp() {
    echo -e "Installing warp 🪄"
    sleep 2s
    sudo apt-get install wget gpg
    wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor >warpdotdev.gpg
    sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
    rm warpdotdev.gpg
    sudo apt update || true
    sudo apt install warp-terminal -y
}

function install_nvm() {
    echo -e "Installing NVM 🔰"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    source ~/.bashrc
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
    echo /usr/local/bin/fish | sudo tee -a /etc/shells
    echo $password | sudo chsh -s $(which fish) # To revert => chsh -s $(which bash)
}

# OBS
function install_obs() {
    echo -e "📹 OBS"
    sleep 2s
    echo | sudo add-apt-repository ppa:obsproject/obs-studio
    yes | sudo apt update
    yes | sudo apt install ffmpeg obs-studio
}

# PgAdmin
function install_pgadmin() {
    echo -e "📊 PgAdmin"
    sleep 2s
    curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
    sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
    yes | sudo apt install pgadmin4
}

# Cursor
function install_cursor() {
    echo -e "Installing Cursor..."
    sleep 2s
    wget -O cursor.deb "https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.5"
    sudo apt install ./cursor.deb -y
    rm cursor.deb
}

# Windsurf
function install_windsurf() {
    echo -e "Installing Windsurf..."
    sleep 2s
    curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
    sudo apt-get update
    sudo apt-get install windsurf -y
}

# MySQL Workbench
function install_mysqlworkbench() {
    echo -e "Installing MySQL Workbench 🗄️"
    sleep 2s
    sudo snap install mysql-workbench-community
}

# Brave Browser
function install_brave() {
    echo -e "Installing Brave Browser 🌐"
    sleep 2s
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser -y
}

# Tor Browser
function install_torbrowser() {
    echo -e "Installing Tor Browser 🌐"
    sleep 2s
    sudo apt install torbrowser-launcher -y
}

# opencode
function install_opencode() {
    echo -e "Installing opencode..."
    sleep 2s
    curl -fsSL https://opencode.ai/install | bash
}

# Obsidian
function install_obsidian() {
    echo -e "Installing Obsidian 📝"
    sleep 2s
    sudo snap install obsidian
}

# Pinta
function install_pinta() {
    echo -e "Installing Pinta 🎨"
    sleep 2s
    sudo snap install pinta
}



# Antigravity (Google)
function install_antigravity() {
    echo -e "Installing Google Antigravity..."
    sleep 2s
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | sudo gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg
    echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
    sudo apt update
    sudo apt install antigravity -y
}
