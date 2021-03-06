#!/bin/sh

# Symlink everything, create foldes if necessary

dotfiles=$(pwd)

# Set up zsh
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

ln -s ${dotfiles}/zprofile ~/.zprofile
ln -s ${dotfiles}/zshrc ~/.zshrc

# Set up vim
mkdir -p ~/.vim/colors
curl -O https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim
mv jellybeans.vim ~/.vim/colors
sed -i 's/let s:background_color = "151515"/let s:background_color = "1E1D2F"/' ~/.vim/colors/jellybeans.vim
ln -s ${dotfiles}/vimrc ~/.vimrc

# Set up the rest of the config files and scripts
mkdir -p ~/.config
mkdir -p ~/.local/bin

for file in ${dotfiles}/config/*; do
    ln -s ${file} ~/.config/
done

for file in ${dotfiles}/local/bin/*; do
    ln -s ${file} ~/.local/bin/
done
