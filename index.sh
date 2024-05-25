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

# Display the dialog checklist and capture the user's selections
selection=$(dialog --checklist "Choose toppings:" 30 80 14 \
  1 "Insomnium 🌑" off \
  2 "Onlyoffice 📃" off \
  3 "Docker 🐳" off \
  4 "Google Chrome 🔎" off \
  5 "Visual Studio Code 💻" off \
  6 "Android Studio 📱" off \
  7 "Spotify 🎧" off \
  8 "Slack 🎙" off \
  9 "Discord 💬" off \
  10 "Warp 🪄" off \
  11 "Fish Terminal 🐟" off \
  12 "OBS 📹" off \
  13 "PgAdmin 📊" off \
  14 "Another Option 🚀" off 2>&1 >/dev/tty)

# Check if the user made a selection
if [[ -z "$selection" ]]; then
  echo "No topping selected."
else
  # Remove leading/trailing spaces and split the selections into an array
  selections=($selection)

  # Loop through each selection and use a case statement to execute different commands
  for sel in "${selections[@]}"; do
    case $sel in
    1) echo "User chose Insomnium 🌑" ;;
    2) echo "User chose Onlyoffice 📃" ;;
    3) echo "User chose Docker 🐳" ;;
    4) echo "User chose Google Chrome 🔎" ;;
    5) echo "User chose Visual Studio Code 💻" ;;
    6) echo "User chose Android Studio 📱" ;;
    7) echo "User chose Spotify 🎧" ;;
    8) echo "User chose Slack 🎙" ;;
    9) echo "User chose Discord 💬" ;;
    10) echo "User chose Warp 🪄" ;;
    11) echo "User chose Fish Terminal 🐟" ;;
    12) echo "User chose OBS 📹" ;;
    13) echo "User chose PgAdmin 📊" ;;
    14) echo "User chose Another Option 🚀" ;;
    *) echo "Unknown selection" ;;
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
