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

# ====================================
# Show the options
# ====================================

# Optional tools
source optional_tools.sh

# Display the dialog checklist and capture the user's selections
selection=$(dialog --checklist "Choose toppings:" 30 80 13 \
  1 "Insomnium 🌑" on \
  2 "Onlyoffice 📃" on \
  3 "Docker 🐳" on \
  4 "Google Chrome 🔎" on \
  5 "Visual Studio Code 💻" on \
  6 "Android Studio 📱" on \
  7 "Spotify 🎧" on \
  8 "Slack 🎙" on \
  9 "Discord 💬" on \
  10 "Warp 🪄" on \
  11 "Node Version Manager" on \
  12 "Fish Terminal 🐟" on \
  13 "OBS 📹" on \
  14 "PgAdmin 📊" on 2>&1 >/dev/tty)

# Check if the user made a selection
if [[ -z "$selection" ]]; then
  echo "No topping selected."
else
  # Remove leading/trailing spaces and split the selections into an array
  selections=($selection)

  # Loop through each selection and use a case statement to execute different commands
  for sel in "${selections[@]}"; do
    case $sel in
    1) install_insomnium ;;
    2) install_onlyoffice ;;
    3) install_docker ;;
    4) install_chrome ;;
    5) install_visualstudio ;;
    6) install_android_studio ;;
    7) install_spotify ;;
    8) install_slack ;;
    9) install_discord ;;
    10) install_warp ;;
    11) install_warp ;;
    12) install_fish_terminal ;;
    13) install_obs ;;
    14) install_pgadmin ;;
    *) echo "Unknown selection" ;;
    esac
  done
fi

echo -e "Please restart your system..."
