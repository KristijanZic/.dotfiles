queryAction() {
    local queryMessage="${1:-"No query message! Input NO (y/N): "}"
    local invalidResponse="${2:-"Invalid response."}"
    local timeoutResponse="${3:-"Timed out."}"
    # local countdown="${4:-8}"
    local countdown="${4}"
    local yesFunction=${5:-echo "Accepted."}
    local noFunction=${6:-echo "Rejected."}

    while true; do

        if [ -z "$countdown" ]; then
            local yn
            read -p "$queryMessage: " yn
        fi

        if ! [ -z "$countdown" ]; then
            while [ $countdown -gt -1 ]; do
                local yn
                printf "\r%s$queryMessage $countdown: "
                read -t 1 yn
                if [ $? -eq 0 ]; then
                    break
                fi
                # ( (countdown--))
                let "countdown=countdown-1"
            done
        fi

        if [ -n "$yn" ]; then
            case $yn in
            [yY] | yes | Yes | YES)
                $yesFunction
                break
                ;;
            [nN] | no | No | NO)
                $noFunction
                break
                ;;
            *)
                if [ $countdown -le -1 ]; then
                    echo "\n    $timeoutResponse"
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
