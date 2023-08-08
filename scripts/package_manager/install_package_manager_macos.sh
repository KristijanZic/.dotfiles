#!/bin/sh

queryUser() {
    local appLauncherName="${1}"
    local queryMessage="${2:-"No query message"}"
    local yesResponse="${3}"
    local noResponse="${4}"
    local invalidResponse="${5}"
    local timeoutMessage="${6}"
    local countdown="${7:-8}"
    local installFunction=$8

    while true; do
        while [ $countdown -gt -1 ]; do
            local yn
            printf "\r%s$queryMessage $countdown "
            read -t 1 yn
            if [ $? -eq 0 ]; then
                break
            fi

            # ( (countdown--))
            let "countdown=countdown-1"
        done

        if [ -n "$yn" ]; then
            case $yn in
            [yY] | yes | Yes | YES)
                echo "Installing..."
                $installFunction
                echo $yesResponse
                break
                ;;
            [nN] | no | No | NO)
                echo $noResponse
                break
                ;;
            *)
                if [ $countdown -le -1 ]; then
                    echo "    $timeoutMessage"
                    break
                fi
                echo $invalidResponse
                ;;
            esac
        else
            echo "\n    $timeoutMessage"
            break
        fi
    done
}

install_package_manager_macos() {
    # TODO: Needs implementation
    echo "TODO: Installing homebrew..."
}
