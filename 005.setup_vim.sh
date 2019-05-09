#!/bin/bash
source ~/.colorc
pwarn "Try: cp -rf vimfiles/dugi.vim     ~/.vim"
pwarn "Try: cp -rf vimfiles/dugi.viminfo ~/.viminfo"
pwarn "Try: cp -rf vimfiles/dugi.vimrc   ~/.vimrc"
cp -rf vimfiles/dugi.vim     ~/.vim
cp -rf vimfiles/dugi.viminfo ~/.viminfo
cp -rf vimfiles/dugi.vimrc   ~/.vimrc
pdone "Setup vim [OK]"
