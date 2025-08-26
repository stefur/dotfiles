#!/bin/sh

# Symlink everything, create folders if necessary

dotfiles=$(pwd)

# Set up zsh
ln -sfn ${dotfiles}/zprofile ~/.zprofile
ln -sfn ${dotfiles}/zshrc ~/.zshrc

# Set up the rest of the config files and scripts
mkdir -p ~/.config
mkdir -p ~/.config/service
mkdir -p ~/.local/bin

# Install the config files
for file in ${dotfiles}/config/*; do
    ln -sfn ${file} ~/.config/
done

# Install user services
for file in ${dotfiles}/service/*; do
    ln -sfn ${file} ~/.config/service
done

# Install conf file for turnstile
ln -sfn ${dotfiles}/service/turnstile-ready/conf ~/.config/service/turnstile-ready

# Install scripts
for file in ${dotfiles}/local/bin/*; do
    ln -sfn ${file} ~/.local/bin/
done

# Symlink lock to be picked up by zzz-user-hooks
ln -sfn ${dotfiles}/local/bin/lock.sh ~/.onsuspend

# Install the kernel hook & battery level check & allow zzz for the user so swayidle can call it
sudo -p "We need sudo to install the vkpurge kernel hook, enable polkit rule for zzz and create the battery check via cron. Password:" ln -s ${dotfiles}/etc/kernel.d/post-install/60-vkpurge /etc/kernel.d/post-install
sudo ln -sfn ${dotfiles}/etc/sudoers.d/99-allow-zzz /etc/sudoers.d
sudo mkdir -p /etc/elogind/sleep.conf.d
sudo ln -sfn ${dotfiles}/etc/elogind/sleep.conf.d/99-no-suspend.conf /etc/elogind/sleep.conf.d
echo "* * * * * root /home/stefur/.local/bin/check-battery.sh" | sudo tee /etc/cron.d/suspend-if-low-bat