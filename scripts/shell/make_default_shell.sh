#!/bin/sh

make_default_shell() {
    shell="${1}"
    Shell=$(capitalize_first_letter "$shell")

    countdown=8

    if grep -q $shell $SHELL; then
        echo "${Green}[✓]${Style_Off} ${Bold}${Shell} is already the default shell.${Style_Off}"
    else
        echo "${Shell} is not the default shell"

        while true; do
            while [ $countdown -gt -1 ]; do
                printf "\r%sDo you want to make ${Shell} the default shell? (y/n) $countdown "
                read -t 1 ynDefault
                if [ $? -eq 0 ]; then
                    break
                fi

                # ( (countdown--))
                let "countdown=countdown-1"
            done

            if [ -n "$ynDefault" ]; then
                case $ynDefault in
                [yY] | yes | Yes | YES)
                    echo "Changing the default shell to ${Shell}..."
                    # chsh -s $(which fish)
                    sudo chsh -s $(which $shell) $USER
                    echo "${Green}[✓]${Style_Off} ${Bold}${Shell} set as default shell${Style_Off}"
                    $shell
                    break
                    ;;
                [nN] | no | No | NO)
                    echo exiting...
                    break
                    ;;
                *)
                    if [ $countdown -le -1 ]; then
                        echo "\n    ${Yellow}!${Style_Off} ${Bold}Timeout reached.${Style_Off}\nContinuing the script."
                        break
                    fi
                    echo "Invalid response"
                    ;;
                esac
            else
                echo "\n    ${Yellow}!${Style_Off} ${Bold}Timeout reached.${Style_Off}\nContinuing the script."
                break
            fi
        done
    fi

    # # Add Shell as a default shell
    # if grep -q $shell $SHELL; then
    #     echo "${Green}[✓]${Style_Off} ${Bold}${Shell} is already the default shell.${Style_Off}"
    # else
    #     echo "${Shell} is not the default shell"

    #     while true; do
    #         read -p "Do you want to make ${Shell} the default shell? (y/n) " yn
    #         if [ -n "$yn" ]; then
    #             case $yn in
    #             [yY] | yes | Yes | YES)
    #                 echo "Changing the default shell to ${Shell}..."
    #                 # chsh -s $(which fish)
    #                 sudo chsh -s $(which $shell) $USER
    #                 echo "${Green}[✓]${Style_Off} ${Bold}${Shell} set as default shell${Style_Off}"
    #                 $shell
    #                 break
    #                 ;;
    #             [nN] | no | No | NO)
    #                 echo exiting...
    #                 # exit
    #                 break
    #                 ;;
    #             *)
    #                 echo "Invalid response"
    #                 # exit 1
    #                 ;;
    #             esac
    #         else
    #             echo -e "\nTimeout reached. Continuing the script."
    #             break
    #         fi
    #     done
    # fi
}
