#!/bin/sh

# Symlink everything, create folders if necessary

dotfiles=$(pwd)

# Set up zsh
ln -sfn ${dotfiles}/zprofile ~/.zprofile
ln -sfn ${dotfiles}/zshrc ~/.zshrc

# Set up the rest of the config files and scripts
mkdir -p ~/.config
mkdir -p ~/.local/bin

# Install the config files
for file in ${dotfiles}/config/*; do
    ln -sfn ${file} ~/.config/
done

# Install scripts
for file in ${dotfiles}/local/bin/*; do
    ln -sfn ${file} ~/.local/bin/
done
