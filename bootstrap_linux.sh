#!/bin/bash

git clone https://github.com/andii1701/emacs.d-24.git .emacs.d
echo "my custom stuff" >> ~/.bashrc
echo "source ~/.emacs.d/.bashrc" >> ~/.bashrc

ln -s ~/.emacs.d/.emacs .emacs
