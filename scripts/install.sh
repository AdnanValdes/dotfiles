#!/bin/bash

# Update and upgrade OS
sudo apt update && sudo apt full-upgrade -y

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


readAppList programs.txt

# Run shell scripts for more involved installs
printf "Beginning complex installs..."
for f in ../programs/installScripts/*.sh
	do
	printf "Installing %s...\n" ${f%%.*}
	bash "$f" -H
	printf "\nDone!"
	done

# Create symlinks for dotfiles
./symlink_dotfiles.sh

# Update dconf from personal settings
printf "\nLoading dconf configuration..."
dconf load /org/gnome/ < ../settings.dconf

printf "\nDone!\nStarting cleanup..."
sudo apt upgrade -y
sudo apt autoremove -y
