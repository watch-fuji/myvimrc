#!/bin/sh
cp ~/.vimrc ~/myvimrc/
cp -rf ~/.vim/ ~/myvimrc/.vim/
cd ~/myvimrc/
git add -u
if [ -z $# ]; then
  git commit -a -m "change vimrc"
else
  git commit -a -m "$*"
fi
git push origin master
