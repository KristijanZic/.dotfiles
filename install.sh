source $HOME/.dotfiles/scripts/os_variables.sh
source $HOME/.dotfiles/scripts/ansi_styles.sh
source $HOME/.dotfiles/scripts/hero.sh
source $HOME/.dotfiles/scripts/query_action.sh
source $HOME/.dotfiles/scripts/shell/setup_shell.sh
source $HOME/.dotfiles/scripts/package_manager/setup_package_manager.sh

capitalize_first_letter() {
    echo "$(tr '[:lower:]' '[:upper:]' <<<"${1:0:1}")${1:1}"
}

restow() {
    local OPTIND
    local config="${1}"
    printf "Stowing $config..."
    stow --restow -t ~ -d $HOME/.dotfiles $config
    printf "\r%s${Green}[✓]${Style_Off} Stowed $config\n"
}

restorw_all() {
    echo "Restowing all config files:"
    restow bin
    restow zsh
    restow alacritty
    echo "....${Green}DONE${Style_Off}"
}

install_package() {
    local package="${1}"

    case $package in
    brew) setup_package_manager "brew" ;;
    fish) setup_shell "fish" ;;
    all)
        setup_package_manager "brew"
        setup_shell "fish"
        ;;
    *) return 1 ;; # illegal option
    esac
}

main() {
    local OPTIND
    local arg

    show_hero

    [[ $# -eq 0 ]] && restorw_all

    while getopts 'i:r:' arg; do
        case ${arg} in
        i) install_package ${OPTARG} ;;
        r)
            [ ${OPTARG} == "all" ] && restorw_all
            [ ${OPTARG} == "all" ] || restow ${OPTARG}
            ;;
        *) return 1 ;; # illegal option
        esac
    done
}

main $@
