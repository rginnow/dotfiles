function ping --wraps 'ping' --description 'Ping an IP 5 times'
    command ping -c 5 $argv
end
