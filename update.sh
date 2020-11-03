#!/usr/bin/bash
echo "removing old dotfiles"
rm ./.config/i3/*       -rf
rm ./.config/i3blocks/* -rf
rm ./.config/nvim/*     -rf
rm ./.gitconfig
rm ./.zshrc

echo "copying new dotfiles"
cp ~/.config/i3/*       ./.config/i3/       -r
cp ~/.config/i3blocks/* ./.config/i3blocks/ -r
cp ~/.config/nvim/*     ./.config/nvim/     -r
cp ~/.gitconfig         ./
cp ~/.zshrc             ./
echo "done"
