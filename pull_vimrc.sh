#!/bin/sh
cd ~/myvimrc/
git fetch
git merge origin/master

cp ~/myvimrc/.vimrc ~/.vimrc
cp -rf ~/myvimrc/.vim/ ~/.vim/
cd .
