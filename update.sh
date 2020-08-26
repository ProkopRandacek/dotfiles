echo "removing old dotfiles"
rm ./.config/nvim/* -rf
rm ./.config/fish/* -rf
rm ./.gitconfig

echo "copying new dotfiles"
cp ~/.config/nvim/* ./.config/nvim/ -r
cp ~/.config/fish/* ./.config/fish/ -r
cp ~/.gitconfig     ./

echo "done"
