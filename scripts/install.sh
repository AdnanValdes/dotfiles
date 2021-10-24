#!/bin/bash

read -p "Would you like to perform a full-upgrade? [Y/N]" choice
read -p "Install programs from txt file? [Y/N]" fromtxtfile
read -p "Is this a headless server? [Y/N]" isheadless

choice=$(echo "$choice" | tr '[:lower:]' '[:upper:]')
fromtxtfile=$(echo "$fromtxtfile" | tr '[:lower:]' '[:upper:]')
isheadless=$(echo "$isheadless" | tr '[:lower:]' '[:upper:]')


if [[ "$choice" == "Y" ]]; then 
	sudo apt update && sudo apt full-upgrade -y # Update and upgrade OS
else
	sudo apt update && sudo apt upgrade -y
fi
# Install function from https://github.com/victoriadrake/dotfiles
function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Uses program names from textfile for installation
function readAppList {
	printf "\nInstalling apps listed in %s...\n" "$1"
	while IFS= read -r line;
		do
			if [[ "$line" = \#* ]] 
			then 
				continue 
			fi

			install "$line"
		done < ../apps/$1
}


# Install programs using provided shell scritps in ..programs/*
function readInstallScripts {
	printf "Installing from %s...\n" "${1}"
	for f in ../programs/${1}*.sh
		do
			printf "Installing %s...\n" "${f%%.*}"
			bash "$f" -H
		done
}


if [[ "$fromtxtfile" == "Y" ]]; then
	printf "Reading programs.txt"
	readAppList programs.txt
fi

readInstallScripts ./priors/

if [[ "$isheadless" == "Y" ]]; then
	readInstallScripts ./basic/
else
	readInstallScripts ./basic/
	readInstallScripts ./utilities/
	readInstallScripts ./misc/
fi
# Create symlinks for dotfiles
./symlink_dotfiles.sh

# Update dconf from personal settings
printf "\nLoading dconf configuration..."
dconf load /org/gnome/ < ../settings.dconf


printf "\nRespect and enjoy the peace."
