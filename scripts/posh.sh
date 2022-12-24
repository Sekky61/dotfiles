#!/bin/bash
# Assumes $PWD dotfiles

wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh

wget https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json
mkdir -p ~/.poshthemes
mv atomic.omp.json ~/.poshthemes/atomic.omp.json

# TODO
# configure printing command:
# oh-my-posh print primary --config ~/.poshthemes/atomic.omp.json

# font
unzip resources/RobotoMono.zip -d tmp/tempfont
mv tmp/tempfont/* /usr/local/share/fonts
fc-cache -f -v # Update font cache
