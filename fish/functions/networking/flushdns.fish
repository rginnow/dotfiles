function flushdns -d 'Flush DNS cache'
    if test (uname -s) != Darwin
        echo >&2 "Cannot execute command. MacOS not detected."
        return 1
    end

    dscacheutil -flushcache && sudo killall -HUP mDNSResponder
end
