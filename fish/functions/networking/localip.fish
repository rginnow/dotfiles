function localip --wraps 'ipconfig' --description 'Get this device\'s local IP address'
    command ipconfig getifaddr en0 $argv
end
