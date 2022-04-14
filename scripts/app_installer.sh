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
    
    # Clean up
    xargs -a remove sudo apt --purge remove -y
    sudo apt autoremove -y
    # Arch based installs

else
    # Installs on Arch
    xargs -a packages yay -S --noconfirm
    xargs -a to_remove yay -Rnc --noconfirm
fi

# Python imports for NVIM and base utils
pip install pynvim jedi numpy pandas

# Set fish as default shell
chsh -s $(which fish)
