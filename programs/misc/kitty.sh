#!/bin/bash

sudo apt install kitty
set THEME https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/gruvbox_dark.conf
wget "$THEME" -P ../.config/kitty/
mv gruvbox_dark.conf theme.conf

