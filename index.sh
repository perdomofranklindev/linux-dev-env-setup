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


# Display the checklist using dialog
selected_toppings=$(dialog --checklist "Choose toppings:" 10 40 3 \
        1 "Insomnium 🌑" on \
        2 "Onlyoffice 📃" on \
        3 "Docker 🐳" on 2>&1 >/dev/tty)

# Process the selected toppings
case "$selected_toppings" in
    *Insomnium*)
        echo "Running command for Insomnium..."
        # Add your command for Insomnium here
        ;;
    *Onlyoffice*)
        echo "Running command for Onlyoffice..."
        # Add your command for Onlyoffice here
        ;;
    *Docker*)
        echo "Running command for Docker..."
        # Add your command for Docker here
        ;;
    *)
        echo "No toppings selected."
        ;;
esac
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
