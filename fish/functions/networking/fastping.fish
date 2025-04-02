function fastping --wraps 'ping' --description 'alias -> ping -c 100 -i 0.2 :: Ping an IP quickly 100 times'
    ping -c 100 -i 0.2 $argv
end
