#!/bin/sh
cd ~/
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
cd myvimrc/
sh pull_vimrc.sh
cd ~/
vim
