#!/bin/bash

sudo apt-get install htop
sudo apt-get install ack-grep
sudo apt-get install git tig

git clone https://github.com/andii1701/emacs.d-24.git .emacs.d
echo "# my custom stuff" >> ~/.bashrc
echo "source ~/.emacs.d/.bashrc" >> ~/.bashrc

ln -s ~/.emacs.d/.emacs .emacs
# build emacs
sudo apt-get install build-essential
sudo apt-get build-dep emacs24
cd ~/Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar -xzvf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
sudo make install

# install java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

# 32bit libs for android-sdk
sudo apt-get install lib32z1 lib32ncurses5 lib32stdc++6


