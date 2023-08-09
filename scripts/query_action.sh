queryAction() {
    # OPTIND is initialized to 1 each time the shell or a shell script is invoked.
    # The shell does not reset OPTIND automatically;
    # it must be manually reset between multiple calls to getopts within the same
    # shell invocation if a new set of parameters is to be used.
    #
    # with either local OPTIND or OPTIND=1 otherwise the provided args won't be red
    # and the variables will fallback to default values.
    local OPTIND
    local arg
    local countdown
    local queryMessage="No query message! Input NO (y/N): "
    local invalidResponse="Invalid response."
    local timeoutResponse="Timed out."
    # Random high positional argument that fails and falls back to default every time
    # in order to be able to pass a function as a default value in the absence of the
    # named parameter in which case it gets overriden by getops handling part.
    local yesFunction=${100:-echo "Accepted."}
    local noFunction=${101:-echo "Rejected default."}

    while getopts 'c:q:i:t:y:n:' arg; do
        case ${arg} in
        c) countdown="${OPTARG}" ;;
        q) queryMessage="${OPTARG:-"No query message! Input NO (y/N): "}" ;;
        i) invalidResponse="${OPTARG:-"Invalid response."}" ;;
        t) timeoutResponse="${OPTARG:-"Timed out."}" ;;
        y) yesFunction=${OPTARG:-echo "Accepted."} ;;
        n) noFunction=${OPTARG:-echo "Rejected."} ;;
        *) return 1 ;; # illegal option
        esac
    done

    while true; do

        if [ -z "$countdown" ]; then
            local yn
            read -p "$queryMessage " yn
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
