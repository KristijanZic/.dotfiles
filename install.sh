source $HOME/.dotfiles/scripts/os_variables.sh
source $HOME/.dotfiles/scripts/ansi_styles.sh
source $HOME/.dotfiles/scripts/hero.sh
source $HOME/.dotfiles/scripts/shell/setup_shell.sh

capitalize_first_letter() {
    echo "$(tr '[:lower:]' '[:upper:]' <<<"${1:0:1}")${1:1}"
}

show_hero
setup_shell "fish"

restow() {
    config="${1}"
    printf "Stowing $config..."
    stow --restow -t ~ -d $HOME/.dotfiles $config
    printf "\r%sStowed $config..."
    echo ""
}

restow bin
restow zsh
restow alacritty
echo "DONE"
