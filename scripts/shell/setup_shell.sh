source $HOME/.dotfiles/scripts/shell/install_shell.sh
source $HOME/.dotfiles/scripts/shell/add_to_login_shells.sh
source $HOME/.dotfiles/scripts/shell/make_default_shell.sh

setup_shell() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")
    shellsFile="/etc/shells"

    install_shell $shell

    add_to_login_shells $shell $shellsFile

    make_default_shell $shell

}
