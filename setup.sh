#!/bin/bash

#
# The main script
#
# Assumes child scripts would kill program if something went wrong
#

# Check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# functions

function echo_success() {
	echo "[ OK ]"
}

function cleanup() {
    rm -fr tmp
    echo "Script finished."
}

# Prepare tmp folder
mkdir -p tmp

echo "Actions will be logged in setup_log"
#exec 1>>setup_log 2>>setup_log

echo "Updating and Upgrading"
apt-get update && apt-get upgrade -y

echo "===  GIT  ==="
source scripts/git.sh
echo_success

echo "===  CONFIGS  ==="
source scripts/configs.sh
echo_success

echo "===  posh  ==="
source scripts/posh.sh
echo_success

echo "===  rust  ==="
source scripts/rust.sh
echo_success

echo "===  ssh  ==="
source scripts/ssh.sh
echo_success

echo "===  terminator  ==="
source scripts/terminator.sh
echo_success

echo "===  theme  ==="
source scripts/theme.sh
echo_success

echo "===  vscode  ==="
source scripts/vscode.sh
echo_success

echo "===  programs  ==="
source scripts/programs.sh
echo_success

# Finish
cleanup

# TODOs

# todo keyboard shortcuts for suspend, hotspot

# What else to do? https://www.youtube.com/watch?v=GrI5c9PXS5k
# allow partner repositories
# set DNS to 1.1.1.1 and 1.0.0.1

# czech layout in settings > region
# sudo setxkbmap -layout cz

# todo tool https://github.com/slimm609/checksec.sh/zipball/main

# todo alt+tab scroll fix: imwheel
# start automatically after startup
# look into ~/.imwheelrc (https://github.com/freeplane/freeplane/issues/134)

# todo krusader theme and first launch

# todo hotspot macro

# todo https://github.com/madler/pigz

# todo custom alias for hexdump, ...

# todo git credential helper
# sudo apt install libsecret-1-dev
# git config --global credential.helper libsecret
# check if configured correctly with: git credential-libsecret

# todo zoxide https://github.com/ajeetdsouza/zoxide
# cargo install zoxide --locked
# or
# apt install zoxide
# eval "$(zoxide init bash)" 

# todo fzf fuzzyfinder, used by zoxide
# sudo apt-get install fzf

# todo navi
# cargo install --locked navi
# todo some custom cheatsheets
# cheat to remove node_modules and build folders

# todo starship
# replace posh with starship
# cargo install starship --locked
# config to ~/.config/starship.toml
# https://starship.rs/config/#prompt
