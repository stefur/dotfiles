#!/bin/sh

# Symlink everything, create folders if necessary

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
sed -i 's/let s:background_color = "151515"/let s:background_color = "1F1F28"/' ~/.vim/colors/jellybeans.vim
ln -s ${dotfiles}/vimrc ~/.vimrc

# Set up the rest of the config files and scripts
mkdir -p ~/.config
mkdir -p ~/.config/service
mkdir -p ~/.local/bin

# Install the config files
for file in ${dotfiles}/config/*; do
    ln -s ${file} ~/.config/
done

# Install user services
for file in ${dotfiles}/service/*; do
    ln -s ${file} ~/.config/service
done

# Install conf file for turnstile
ln -s ${dotfiles}/service/turnstile-ready/conf ~/.config/service/turnstile-ready

# Install scripts
for file in ${dotfiles}/local/bin/*; do
    ln -s ${file} ~/.local/bin/
done

# Symlink lock to be picked up by zzz-user-hooks
ln -s ${dotfiles}/local/bin/lock.sh ~/.onsuspend

# Install the kernel hook & battery level check & create polkit rule to enable zzz for the user so swayidle can call it with pkexec

sudo -p "We need sudo to install the vkpurge kernel hook, enable polkit rule for zzz and create the battery check via cron. Password:" ln -s ${dotfiles}/etc/kernel.d/post-install/60-vkpurge /etc/kernel.d/post-install
sudo ln -s ${dotfiles}/etc/polkit-1/rules.d/99-zzz.rules /etc/polkit-1/rules.d/99-zzz.rules
echo "* * * * * root /home/stefur/.local/bin/check-battery.sh" | sudo tee /etc/cron.d/suspend-if-low-bat