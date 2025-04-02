function ping -w 'ping' -d 'alias -> ping -c 5 :: Ping an IP 5 times'
    command ping -c 5 $argv
end
