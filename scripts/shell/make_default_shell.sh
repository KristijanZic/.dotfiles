make_default_shell() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")

    if_yes_change_shell() {
        echo "Changing the default shell to ${Shell}..."
        # chsh -s $(which fish)
        sudo chsh -s $(which $shell) $USER
        echo "${Green}[✓]${Style_Off} ${Bold}${Shell} set as default shell${Style_Off}"
        $shell
    }

    if_no_echo_message() (
        echo Default shell is $SHELL Continuing script...
    )

    if grep -q $shell $SHELL; then
        echo "${Green}[✓]${Style_Off} ${Bold}${Shell} is already the default shell.${Style_Off}"
    else
        echo "${Shell} is not the default shell"

        queryAction \
            -c 8 \
            -q "Do you want to make ${Shell} the default shell? (y/N)" \
            -i "Invalid input! Please enter 'yes' or 'no'." \
            -t "${Yellow}!${Style_Off} ${Bold}Timeout reached.${Style_Off}\nContinuing the script..." \
            -y if_yes_change_shell \
            -n if_no_echo_message
    fi
}
