#!/bin/sh
cd ~/
sh myvimrc/pull_vimrc.sh
rm -rf .vim/
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
vim
