<div align="center">
    <img alt"my dotfiles" src="https://dotfiles.github.io/images/dotfiles-logo.png">
    # my dotfiles
</div>
<p align="center">
dotfiles written for Pop!\_OS and Manjaro.
</p>

<div align="center">
    [![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
    [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
    ![Manjaro](https://img.shields.io/badge/Manjaro-35BF5C?style=for-the-badge&logo=Manjaro&logoColor=white)
    ![Pop! OS](https://img.shields.io/badge/Pop!_OS-48B9C7?style=for-the-badge&logo=Pop!_OS&logoColor=white)
    ![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
</div>
<br />

The dotfiles here are composed of various configurations and choices I have made - and continue to make - while playing with Linux. They include the installation and configuration of `fish`, `nvim` and a few applications I like to use. 

The scripts here assume either an installation of Pop!\_OS or Manjaro with GNOME Desktop.

## Usage

```Bash
git clone https://github.com/AdnanValdes/dotfiles.git
cd ./dotfiles
./install
```

Note that if the install fails, you might need to change the permissions of the scripts; in particular, you'd have to run:
```Bash
chmod +s ./scripts/install.sh ./scripts/app_installer.sh ./scripts/symlink_dotfiles.sh
```

If you don't want to install all the programs I use, go to the `app_installer.sh` script and remove (or add!) whatever you want.


### Dependencies

Because I've written these files by using first Pop!\_OS and then Manjaro (both with GNOME environments), the scripts assume you have access to either `apt` or `pacman`. 

## Contact

If you run into any issues, feel free to contact me or to open an issue on this repo.

## License

MIT


