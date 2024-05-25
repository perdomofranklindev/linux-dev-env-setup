#!/bin/bash

function update_system() {
    echo "🔄 Updating system..."
    echo $password | sudo -S apt-get update
    echo $password | sudo -S apt-get upgrade
    echo "✔️ System updated successfully!"
}

function default_tools() {
    echo "💻 Setting up the environment..."

    # Curl
    echo "Installing curl 🌐"
    sleep 2s
    yes | sudo apt-get install curl

    # # Snap
    # echo "Snap 🐦"
    # sleep 2s
    # sudo apt install snapd

    # # Github
    # echo -e "Installing Git 👨‍💻"
    # sleep 2s
    # yes | sudo apt-get install git
    
    # # Dialog
    # echo -e "Dialog 💬"
    # sleep 2s
    # yes | sudo apt-get install dialog

    echo -e "\n"
}
