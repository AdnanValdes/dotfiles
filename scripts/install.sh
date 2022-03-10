#!/bin/bash
printf "Hello, and welcome!\n"
read -p "[Git configuration] Enter your email: " email
read -p "[Git configuration] Enter your user name: " username



distro="$(cat /etc/*-release | grep ^ID= | sed 's/.*[=]//')"
distroFamily="$(cat /etc/*-release | grep ID_LIKE | sed 's/.*[=]//')"

if [[ "$distro" == "Ubuntu" ]] || [[ "$distroFamily" == "Debian" ]]; then
	sudo apt update && sudo apt full-upgrade -y # Update and upgrade OS
else
    sudo pacman -Sy base-devel --noconfirm
    sudo pacman -Syu --noconfirm
    sudo pacman -S yay --noconfirm
fi

# Install apps
./app_installer.sh

# Create symlinks for dotfiles
./symlink_dotfiles.sh

# Update dconf from personal settings
printf "\nLoading dconf configuration..."
if [[ "$distro" == "Ubuntu" ]] || [[ "$distroFamily" == "Debian" ]]; then
    dconf load /org/gnome/ < ../settings_debian.dconf
    printf "\nFinalizing and cleaningup..."
    sudo apt update -y
    sudo apt autoremove -y
#else
#    dconf load /org/gnome/ < ../settings_arch.conf
fi

git config --global user.email "$email"
git config --global user.name "$username"

printf "\nRespect and enjoy the peace."
