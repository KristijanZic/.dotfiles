install_shell_linux() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")

    case $ID in

    arch)
        echo "Installing ${Shell} on $NAME via pacman."
        sudo pacman -S $shell
        ;;

    ubuntu | debian | elementary | linuxmint)
        echo "Installing ${Shell} on $NAME via apt."
        sudo apt install $shell
        ;;

    fedora)
        echo "Installing ${Shell} on $NAME via dnf."
        dnf install $shell
        ;;

    rhel)
        echo "Installing ${Shell} on $NAME via yum."
        yum install $shell
        ;;

    opensuse-leap)
        echo "Installing ${Shell} on $NAME via zypper."
        zypper install $shell
        ;;

    *)
        echo "$NAME distribution is not currently supported"
        echo "To add support for $NAME distribution please open a feature request at:"
        echo "https://github.com/KristijanZic/.dotfiles"
        ;;

    esac
}

install_shell_macos() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")

    if [[ $(command -v brew) ]]; then
        echo "Installing ${Shell} on macOS via Homebrew."
        brew install $shell
        echo "${Green}[✓]${Style_Off} ${Bold}${Shell} installed${Style_Off}"
    elif [[ $(command -v port) ]]; then
        echo "Installing ${Shell} on macOS via MacPorts."
        port install $shell
        echo "${Green}[✓]${Style_Off} ${Bold}${Shell} installed${Style_Off}"
    else
        echo "${Red}[✗]${Style_Off} ${Shell} not installed"
        echo "    ${Yellow}!${Bold} Only Homebrew and MacPorts are currently supported${Style_Off}"
        echo "    ${Green}•${Style_Off} To add support for your package manager please open a feature request at:"
        echo "      🔨 https://github.com/KristijanZic/.dotfiles"
    fi
}

install_shell() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")

    if [[ $(command -v $shell) ]]; then
        echo "${Green}[✓]${Style_Off} ${Bold}${Shell} already installed.${Style_Off}"
    else
        echo "${Shell} shell not installed."
        echo "Determining OS..."

        if [[ "$OSTYPE" == "linux-gnu"* ]]; then

            # Linux
            install_shell_linux $shell

        elif [[ "$OSTYPE" == "darwin"* ]]; then
            # Mac OSX
            install_shell_macos $shell
        fi
    fi
}
