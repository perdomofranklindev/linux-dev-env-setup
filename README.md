# Linux Development Environment Setup

A script to configure a basic development environment on linux.

[Click here to watch the demo](https://vimeo.com/1079581085/2b8a4ffa2a?ts=0&share=copy)

![Screenshot 2024-05-26 105329](https://github.com/perdomofranklindev/linux-dev-env-setup/assets/92344582/ebb200db-e20e-4c60-a1ce-0550def3047c)

## How to use
1. Give permissions: `sudo chmod +x index.sh`  
2. Execute: `./index.sh`

## Default tools
1. [Curl 🌐](https://curl.se/)
2. [Snap 🐦](https://snapcraft.io/docs/installing-snap-on-ubuntu)
3. [Git 🐈](https://git-scm.com/)
4. [Dialog 💬](https://www.linuxjournal.com/article/2807)

## Optional tools

1. [Visual Studio Code 💻](https://code.visualstudio.com/)
2. [Cursor](https://cursor.com/)
3. [Windsurf](https://windsurf.com/)
4. [Antigravity](https://antigravity.google/)
5. [Insomnium 🌑](https://github.com/ArchGPT/insomnium)
6. [opencode 💻](https://opencode.ai/)
7. [Docker 🐳](https://www.docker.com/)
8. [PgAdmin 📊](https://www.pgadmin.org/download/)
9. [MySQL Workbench 🗄️](https://www.mysql.com/products/workbench/)
10. [Google Chrome 🔎](https://www.google.com/intl/es/chrome/)
11. [Brave Browser 🌐](https://brave.com/)
12. [Tor Browser 🌐](https://www.torproject.org/)
13. [Slack 🎙](https://slack.com/)
14. [Discord 💬](https://discord.com/)
15. [Spotify 🎧](https://www.spotify.com/)
16. [OBS 📹](https://obsproject.com/es)
17. [Onlyoffice 📃](https://www.onlyoffice.com/)
18. [Obsidian 📝](https://obsidian.md/)
19. [Pinta 🎨](https://www.pinta-project.com/)
20. [Warp 🪄](https://www.warp.dev/)
21. [Fish Terminal 🐟](https://fishshell.com/)
22. Node Version Manager 🔰
23. [Android Studio 📱](https://developer.android.com/studio)

## Fish terminal extra options

Oh My Fish is an installation manager, you will need it if you want to use NVM on it.

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install >install
fish install --path=~/.local/share/omf --config=~/.config/omf
```

NVM on Fish
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
omf install nvm
```

Change your theme flavour [here](https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md)

You're wondering why the command lines above aren't added on the fish terminal installation? Well, the second command line causes the script to exit prematurely, until now, I haven't found a way to prevent that.

## Dark mode issues

If you're facing some kind of issue with the dark mode, it is likely that is a driver issue, the NVIDIA drivers can sometimes have compatibility issues with specific desktop environment features.

```bash
sudo apt-get remove --purge 'nvidia-.*'
sudo apt-get autoremove
```

```bash
sudo apt-get install xserver-xorg-video-nouveau
```

```bash
sudo reboot
```

## Tested Linux Distributions
- Ubuntu 24.04.2 LTS
- Ubuntu 25.04
