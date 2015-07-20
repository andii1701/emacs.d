#!/bin/bash

git clone https://github.com/andii1701/emacs.d-24.git .emacs.d
echo "#my custom stuff" >> ~/.bashrc
echo "source ~/.emacs.d/.bashrc" >> ~/.bashrc

ln -s ~/.emacs.d/.emacs .emacs

sudo apt-get install build-essential
sudo apt-get build-dep emacs24

# build emacs
cd ~/Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
sudo make install
