function ip -w dig -d 'Get this network\'s public IP address'
    if not test -q dig
        echo >&2 "Cannot execute command. dig not detected."
        return 1
    end

    dig +short myip.opendns.com @resolver1.opendns.com $argv
end
