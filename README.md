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
11. Node Version Manager 🔰
12. [Fish Terminal 🐟](https://fishshell.com/)
13. [OBS 📹](https://obsproject.com/es)
14. [PgAdmin 📊](https://www.pgadmin.org/download/)

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
