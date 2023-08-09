# :construction: Work in progress :construction:

The project is still not stabilised so expect breaking changes in the shell scripts. That said, you can already use it for the config files, personalize current ones, implement new ones etc.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

```text
                                                                      
         $$\            $$\      $$$$$$\  $$\ $$\                     
         $$ |           $$ |    $$  __$$\ \__|$$ |                    
    $$$$$$$ | $$$$$$\ $$$$$$\   $$ /  \__|$$\ $$ | $$$$$$\   $$$$$$$\ 
   $$  __$$ |$$  __$$\\_$$  _|  $$$$\     $$ |$$ |$$  __$$\ $$  _____|
   $$ /  $$ |$$ /  $$ | $$ |    $$  _|    $$ |$$ |$$$$$$$$ |\$$$$$$\  
   $$ |  $$ |$$ |  $$ | $$ |$$\ $$ |      $$ |$$ |$$   ____| \____$$\ 
$$\\$$$$$$$ |\$$$$$$  | \$$$$  |$$ |      $$ |$$ |\$$$$$$$\ $$$$$$$  |
\__|\_______| \______/   \____/ \__|      \__|\__| \_______|\_______/ 
                                                                      
                                                       By KristijanZic
```

# .dotfiles

<a id="about"></a>

A feature-rich installer and dotfiles management script!

Dotfiles uses stow to help you manage your various configuration files.
The process is straightforward: simply move your file together with the entire directory structure from `~/` to your config file into the `~/.dotfiles/<config_dir_name>/` config directory like so:

```sh
mv ~/.config/nvim/init.lua ~/.dotfiles/nvim/.config/nvim/init.lua
```

Then add your `<config_dir_name>` to `restorw_all()` in the `install.sh` like so:

```sh
restorw_all() {
    echo "Restowing all config files:"
    # ...other restows 
    restow <config_dir_name>
    echo "....${Green}DONE${Style_Off}"
}
```

Restow your config to make the links from the the original config paths to the ones we just moved to our `<config_dir_name>` by executing:

```sh
dot -r <config_dir_name>
```

or to restow all run `dot -r all` or just:

```sh
dot
```

## Index

- [About Dotfiles](#about)
- [Index](#index)
- [Git Install](#install)
- [Usage](#usage)

## Git Install

<a id="install"></a>

If you have `git` installed:

1. clone this repo in the root of your user profile
    - `cd ~/` from anywhere then `git clone https://github.com/KristijanZic/.dotfiles.git .dotfiles`
1. `cd ~/.dotfiles`
1. activate `dotfiles` and `dot` by running cd `.dotfiles; ./install.sh`

## Usage

You can run dotfiles by executing `dotfiles` or `dot`:

```sh
dot
```

To install a package `dotfiles` or `dot`:

```sh
dot -i <package_name>
```

*supported packages: brew, fish

</br>

To restow a config `dotfiles` or `dot`:

```sh
dot -r <config_directory_name>
```

*supported configs: bin, nvim, alacritty, zsh
