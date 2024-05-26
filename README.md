# Linux Development Environment Setup

A script to configure a basic development environment on linux.

## How to use
1. Give permissions: `sudo chmod +x index.sh`  
2. Execute: `./index.sh`

## Default tools
1. [Curl 🌐](https://curl.se/)
2. [Snap 🐦](https://snapcraft.io/docs/installing-snap-on-ubuntu)
3. [Git 🐈](https://git-scm.com/)
4. [Dialog 💬](https://www.linuxjournal.com/article/2807)

## Optional tools

1. [Insomnium 🌑](https://github.com/ArchGPT/insomnium)
2. [Onlyoffice 📃](https://www.onlyoffice.com/)
3. [Docker 🐳](https://www.docker.com/)
4. [Google Chrome  🔎](https://www.google.com/intl/es/chrome/?brand=YTUH&gclid=Cj0KCQjw_7KXBhCoARIsAPdPTfgwWCrhGi51XzOTteYA2WEGwQKSe44Qd1Xd0TwE4EKAQ7ZmZ1WUiZ4aAmx_EALw_wcB&gclsrc=aw.ds)
5. [Visual Studio Code 💻](https://code.visualstudio.com/)
6. [Android Studio 📱](https://developer.android.com/studio?hl=es-419&gclid=Cj0KCQjw_7KXBhCoARIsAPdPTfjn_-ZwRMmDmv-MpvEYjZ5YkOECYQuR2JBV-MRVr0QPKTkLzxffGLEaAoUeEALw_wcB&gclsrc=aw.ds)
7. [Spotify 🎧](https://www.spotify.com/)
8. [Slack 🎙](https://slack.com/)
9. [Discord 💬](https://discord.com/)
10. [Warp 🪄](https://www.warp.dev/)
11. Node Version Manager
12. [Fish Terminal 🐟](https://fishshell.com/)
13. [OBS 📹](https://obsproject.com/es)
14. [PgAdmin 📊](https://www.pgadmin.org/download/)

## Fish as a default terminal

```bash
echo /usr/local/bin/fish | sudo tee -a /etc/shells
sudo chsh -s $(which fish)
```



## Tested Linux Distributions
- Ubuntu 24.04

## Credits
Author: [Franklin Perdomo](https://github.com/perdomofranklindev)
