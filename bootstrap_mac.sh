#!/usr/bin/bash

git clone https://github.com/andii1701/emacs.d-24.git .emacs.d

ln -s ~/.emacs.d/.bash_profile .bash_profile
ln -s ~/.emacs.d/.emacs .emacs

sudo xcodebuild -license
# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install python3
brew install bash-completion
brew install emacs --with-cocoa
brew install ack
brew install wget
brew install curl
brew install meld

export EDITOR=emacs

