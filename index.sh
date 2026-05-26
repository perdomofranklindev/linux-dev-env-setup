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

selection=$(dialog --checklist "Choose tools:" 30 80 25 \
  1  "💻 Visual Studio Code" on \
  2  "💻 Cursor" on \
  3  "💻 Windsurf" on \
  4  "💻 Antigravity" on \
  5  "💻 Insomnium" on \
  6  "💻 opencode" on \
  7  "🐳 Docker" on \
  8  "🗄️ PgAdmin" on \
  9  "🗄️ MySQL Workbench" on \
  10 "🌐 Google Chrome" on \
  11 "🌐 Brave Browser" on \
  12 "🌐 Tor Browser" on \
  13 "💬 Slack" on \
  14 "💬 Discord" on \
  15 "🎧 Spotify" on \
  16 "📹 OBS" on \
  17 "📄 Onlyoffice" on \
  18 "📝 Obsidian" on \
  19 "🎨 Pinta" on \
  20 "🎨 Excalidraw" on \
  21 "🎨 tldraw" on \
  22 "🪄 Warp" on \
  23 "🐟 Fish Terminal" on \
  24 "🔰 Node Version Manager" on \
  25 "📱 Android Studio" on 2>&1 >/dev/tty)

if [[ -n "$selection" ]]; then
  for sel in $selection; do
    case $sel in
      1) install_visualstudio ;;
      2) install_cursor ;;
      3) install_windsurf ;;
      4) install_antigravity ;;
      5) install_insomnium ;;
      6) install_opencode ;;
      7) install_docker ;;
      8) install_pgadmin ;;
      9) install_mysqlworkbench ;;
      10) install_chrome ;;
      11) install_brave ;;
      12) install_torbrowser ;;
      13) install_slack ;;
      14) install_discord ;;
      15) install_spotify ;;
      16) install_obs ;;
      17) install_onlyoffice ;;
      18) install_obsidian ;;
      19) install_pinta ;;
      20) install_excalidraw ;;
      21) install_tldraw ;;
      22) install_warp ;;
      23) install_fish_terminal ;;
      24) install_nvm ;;
      25) install_android_studio ;;
    esac
  done
fi

echo -e "Please restart your system..."
