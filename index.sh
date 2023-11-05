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
        install_git
        ;;
        3)
        install_docker
        ;;
        4)
        install_chrome
        ;;
        5)
        install_visualstudio
        ;;
        6)
        install_android_studio
        ;;
        7)
        install_spotify
        ;;
        8)
        install_slack
        ;;
        9)
        install_discord
        ;;
        10)
        install_fish_terminal
        ;;
        11)
        install_obs
        ;;
        12)
        install_pgadmin
    esac
done

echo -e "Please restart your system..."