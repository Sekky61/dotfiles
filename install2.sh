##
##  brew
##

# todo no sudo

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh </dev/null)"
echo "Follow Brew instructions above"

# depends on username !

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$USER/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

##
##  exa
##

brew install exa

echo "Done. Restart shell. Run install2.sh"
