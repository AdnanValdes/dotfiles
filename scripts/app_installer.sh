#!/bin/bash

distro="$(cat /etc/*-release | grep ^ID= | sed 's/.*[=]//')"
distroFamily="$(cat /etc/*-release | grep ID_LIKE | sed 's/.*[=]//')"

if [[ "$distro" == "Ubuntu" ]] || [[ "$distroFamily" == "Debian" ]]; then
    # Basic installs
│   sudo apt install python3 python3-pip fish ripgrep tilix -y --no-install-recommends
│   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
│   chmod u+x nvim.appimage
│   mv nvim.appimage $HOME/.local/bin
    
    # Utility installs
    sudo apt install git sqlite3 htop tree -y

    # Misc installs

    ## Discord
    curl -O https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb
    sudo apt install ./discord-0.0.16.deb -y
    rm ./discord-0.0.16.deb

    ## Brave browser
    sudo apt install apt-transport-https curl -y
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update -y
    sudo apt install brave-browser -y
    
    # Clean up
    sudo apt --purge remove evince eog geary gedit gnome-calculator gnome-help pinyin seahorse texinfo -y
    sudo apt autoremove -y
    # Arch based installs

else
    # Installs on Arch
    yay -S python python-pip fish neovim ripgrep tilix git sqlite3 htop exa discord brave-bin obsidian surfshark-vpn steam qbittorrent calibre jellyfin-media-player  --noconfirm 
    yay -Rnc evince eog geary gedit gnome-calculator gnome-help pinyin seahorse texinfo zsh --noconfirm
    

    # Build jellyfin media player
fi


# Get and set Gruvbox theme for Kitty
#THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/gruvbox_dark.conf
#wget "$THEME" -P ../.config/kitty/
#mv ../.config/kitty/gruvbox_dark.conf ../.config/kitty/theme.conf

# Python imports for NVIM and base utils
pip install pynvim jedi numpy pandas

# Set fish as default shell
chsh -s $(which fish)
