#!/bin/sh

# Symlink everything, create foldes if necessary

dotfiles=$(pwd)

mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh

ln -s ${dotfiles}/zprofile ~/.zprofile
ln -s ${dotfiles}/zshrc ~/.zshrc

mkdir -p ~/.vim
ln -s ${dotfiles}/vim ~/.vim
ln -s ${dotfiles}/vimrc ~/.vimrc

mkdir -p ~/.config
mkdir -p ~/.local/bin

for file in ${dotfiles}/config/*; do
    ln -s ${file} ~/.config/
done

for file in ${dotfiles}/local/bin/*; do
    ln -s ${file} ~/.local/bin/
done
