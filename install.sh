
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

ln -sf ~/src/dotfiles/vimrc ~/.vimrc
ln -sf ~/src/dotfiles/gitconfig ~/.gitconfig
