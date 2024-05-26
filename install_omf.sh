#!/bin/bash
echo -e "Installing Oh my fish 🎨"
sleep 2s
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install >install
echo -e "Curl oh my fish installation done!"
fish install --path=~/.local/share/omf --config=~/.config/omf
