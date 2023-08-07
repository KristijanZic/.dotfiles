add_to_login_shells() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")
    shellsFile="${2}"

    if [[ $(command -v fish) ]]; then
        if grep -q $shell "$shellsFile"; then
            echo "${Green}[✓]${Style_Off} ${Bold}${Shell} is already present in $shellsFile${Style_Off}"
        else
            while true; do
                read -p "Do you want to add ${Shell} to the login shells in $shellsFile ? (y/n) " yn

                case $yn in
                [yY] | yes | Yes | YES)
                    echo "Adding ${Shell} to $shellsFile"
                    command -v fish | sudo tee -a $shellsFile
                    # sudo bash -c 'echo $(which fish) >> /etc/shells'
                    echo "${Green}[✓]${Style_Off} ${Bold}${Shell} added to the $shellsFile${Style_Off}"
                    break
                    ;;
                [nN] | no | No | NO)
                    echo exiting...
                    # exit
                    break
                    ;;
                *)
                    echo "Invalid response"
                    # exit 1
                    ;;
                esac

            done
        fi
    fi
}
