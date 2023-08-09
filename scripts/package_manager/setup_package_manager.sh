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

            if_no_echo_message() (
                echo "    ${Yellow}!${Style_Off} ${Bold}That's okay, you can install Homebrew any time manually${Style_Off}"
                echo "      Follow the installation instructions at https://brew.sh/"
            )

            queryAction \
                -q "Do you want to install Homebrew? (Y/n)" \
                -i "Invalid input! Please enter 'yes' or 'no'." \
                -t "${Yellow}!${Style_Off} ${Bold}Timeout reached.${Style_Off}\nContinuing the script..." \
                -y install_package_manager_macos \
                -n if_no_echo_message

        fi

    fi

}
