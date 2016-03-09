#!/usr/bin/bash

git clone https://github.com/andii1701/emacs.d-24.git .emacs.d

ln -s ~/.emacs.d/.bash_profile .bash_profile
ln -s ~/.emacs.d/.emacs .emacs

sudo xcodebuild -license
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

