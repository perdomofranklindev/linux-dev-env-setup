#!/bin/bash

# Author: Franklin Perdomo <perdomofranklindev@gmail.com>

# ====================================
# Previous setup
# ====================================

# Set your password here
echo -n "Enter your password: "
read -s password
echo ""

# Default programs
source default_programs.sh

update_system
default_tools


dialog --checklist "Choose toppings:" 10 40 3 \
        1 Cheese on \
        2 "Tomato Sauce" on \
        3 Anchovies off

# # ====================================
# # Show the options
# # ====================================

# # UI
# source menu.sh
# # Optional tools
# source optional_tools.sh

# for item in "${UI_WIDGET_RC[@]}"
# do
#     case $item in
#         0)
#         install_insomnium
#         ;;
#         1)
#         install_onlyoffice
#         ;;
#         2)
#         install_docker
#         ;;
#         3)
#         install_chrome
#         ;;
#         4)
#         install_visualstudio
#         ;;
#         5)
#         install_android_studio
#         ;;
#         6)
#         install_spotify
#         ;;
#         7)
#         install_slack
#         ;;
#         8)
#         install_discord
#         ;;
#         9)
#         install_fish_terminal
#         ;;
#         10)
#         install_obs
#         ;;
#         11)
#         install_pgadmin
#     esac
# done

echo -e "Please restart your system..."
