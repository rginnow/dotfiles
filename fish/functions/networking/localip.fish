function localip -w 'ipconfig' -d 'alias -> ipconfig getifaddr en0 :: Get this device\'s local IP address'
    ipconfig getifaddr en0 $argv
end
