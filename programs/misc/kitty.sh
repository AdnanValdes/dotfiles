#!/bin/bash

sudo apt install kitty
THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/gruvbox_dark.conf
wget "$THEME" -P ../.config/kitty/
mv ../.config/kitty/gruvbox_dark.conf ../.config/kitty/theme.conf

