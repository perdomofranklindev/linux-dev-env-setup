#!/bin/bash

# Author: Franklin Perdomo <perdomofranklindev@gmail.com>

# ====================================
# Previous setup
# ====================================

# Default programs
source default_programs.sh

# Set your password here
PASSWORD=$1

if [ -z "$PASSWORD" ]; then
  echo "Please provide a password"
  exit 1
fi

update_system
default_tools

# ====================================
# Show the options
# ====================================

# UI
source menu.sh
# Optional tools
source optional_tools.sh

for item in "${UI_WIDGET_RC[@]}"
do
    case $item in
        0)
        install_insomnia
        ;;
        1)
        install_onlyoffice
        ;;
        2)
        install_docker
        ;;
        3)
        install_chrome
        ;;
        4)
        install_visualstudio
        ;;
        5)
        install_android_studio
        ;;
        6)
        install_spotify
        ;;
        7)
        install_slack
        ;;
        8)
        install_discord
        ;;
        9)
        install_fish_terminal
        ;;
        10)
        install_obs
        ;;
        11)
        install_pgadmin
    esac
done

echo -e "Please restart your system..."
