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

# dialog --checklist "Choose toppings:" 1 2 3 \
#         1 "Insomnium 🌑" on \
#         2 "Onlyoffice 📃" on \
#         3 "Docker 🐳" on

#!/bin/bash

# Display the dialog checklist and capture the user's selections
selection=$(dialog --checklist "Choose toppings:" 15 40 5 1 "Insomnium 🌑" off 2 "Onlyoffice 📃" off 3 "Docker 🐳" off 2>&1 >/dev/tty)

# Check if the user made a selection
if [[ -z "$selection" ]]; then
    echo "No topping selected."
else
    # Remove leading/trailing spaces and split the selections into an array
    selections=($selection)
    
    # Loop through each selection and use a case statement to execute different commands
    for sel in "${selections[@]}"; do
        case $sel in
            1) echo "User chose Insomnium 🌑";;
            2) echo "User chose Onlyoffice 📃";;
            3) echo "User chose Docker 🐳";;
            *) echo "Unknown selection";;
        esac
    done
fi


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
