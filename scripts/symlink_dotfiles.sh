#!/bin/bash

# Move to dotfiles dir
cd ../.config

printf "\nCreating symlinks for dotfiles...\n"

configsDir=$HOME/.config
dotfilesDir=$PWD

for dotfile in $PWD/*
	do
		
		printf "Creating symlink for: ${dotfile}\n"
		rm -rf "${configsDir}/${dotfile##*/}"
		ln -sf "${dotfilesDir}/${dotfile##*/}" "${configsDir}/${dotfile##*/}"  # Symlink syntax: ln {OPTIONS} {SOURCE (actual file)} {LINK (newly created link)} | -sf: softlink, overwrite existing links
	done

printf "Complete!"





