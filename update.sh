#!/usr/bin/bash
echo "removing old dotfiles"
rm ./.config/i3/*     -rf
rm ./.config/nvim/*   -rf
rm ./.config/fish/*   -rf
rm ./.config/ranger/* -rf
rm ./.gitconfig
rm ./.bashrc

echo "copying new dotfiles"
cp ~/.config/i3/*     ./.config/i3/     -r
cp ~/.config/nvim/*   ./.config/nvim/   -r
cp ~/.config/fish/*   ./.config/fish/   -r
cp ~/.config/ranger/* ./.config/ranger/ -r
cp ~/.gitconfig       ./
cp ~/.bashrc          ./
echo "done"
