#!/bin/bash

curl -O https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb
sudo apt install ./discord-0.0.16.deb -y
rm discord-0.0.0.1.deb
