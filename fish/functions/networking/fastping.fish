function fastping --wraps 'ping' --description 'Ping an IP quickly 100 times'
    command ping -c 100 -i 0.2 $argv
end
