source $HOME/.dotfiles/scripts/package_manager/install_package_manager_macos.sh

setup_package_manager() {

    local package_manager="${1}"

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then

        echo "${Green}[✓]${Style_Off} ${Bold}Package manager already installed.${Style_Off}"

    elif [[ "$OSTYPE" == "darwin"* ]]; then

        if [[ $(command -v $package_manager) ]]; then
            echo "${Green}[✓]${Style_Off} ${Bold}Homebrew already installed.${Style_Off}"
        else
            echo "${Red}[✗]${Style_Off} Package manager not installed"
            echo "    ${Yellow}!${Style_Off} ${Bold}Please install Homebrew${Style_Off}"
            # echo "      Follow the installation instructions at https://brew.sh/"

            queryAction "Do you want to install Homebrew? (Y/n)" "Invalid input! Please enter 'yes' or 'no'." "${Yellow}!${Style_Off} ${Bold}Timeout reached.${Style_Off}\nContinuing the script..." "" install_package_manager_macos
        fi

    fi

}
