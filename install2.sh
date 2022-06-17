##
##  brew
##

# todo sudo

echo $USER

nvm install node

echo "Installing mold"
git clone https://github.com/rui314/mold.git
cd mold
git checkout v1.2.1
make -j$(nproc) CXX=g++
make install

echo "Done. Restart shell."
