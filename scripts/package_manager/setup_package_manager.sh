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
            echo "      Follow the installation instructions at https://brew.sh/"
        fi

    fi
}
