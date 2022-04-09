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

## Add network drives
mkdir -p /home/"$USER"/Trantor
mkdir -p /home/"$USER"/Terminus


terminus="$(showmount -e terminus.earth | sed -n 2p | sed -e 's/\s.*$//')"
terminusMNT="terminus.earth:"$terminus" /home/"$USER"/Terminus nfs defaults 0 0"
if ! grep -Fxq "$terminusMNT"  /etc/fstab
    then
        sudo echo "terminus.earth:"$terminusMNT" /home/"$USER"/Terminus nfs defaults 0 0" >> /etc/fstab
fi

trantor="$(showmount -e trantor.earth | sed -n 2p | sed -e 's/\s.*$//')"
trantorMNT="trantor.earth:"$trantor" /home/"$USER"/Trantor nfs defaults 0 0"
if ! grep -Fxq "$terminusMNT" /etc/fstab
    then
        sudo echo "trantor.earth:"$trantorMNT" /home/"$USER"/Terminus nfs defaults 0 0" >> /etc/fstab
fi

git config --global user.email "$email"
git config --global user.name "$username"

rm -rf ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
printf "\nRespect and enjoy the peace."
