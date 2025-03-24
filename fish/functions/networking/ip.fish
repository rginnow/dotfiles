function ip --wraps 'dig' --description 'Get this network\'s public IP address'
    command dig +short myip.opendns.com @resolver1.opendns.com $argv
end
