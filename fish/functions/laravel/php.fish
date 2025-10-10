function php -d "Run PHP with herd if available, otherwise use the system PHP"
    # If we have the herd command, use it
    if type -q herd
        herd php $argv
    # If we don't have the herd command, find and use the php executable
    else if command -v php > /dev/null 2>&1
        command php $argv
    # Otherwise, we probably don't have PHP installed.
    else
        echo "php not found"
        return 1
    end
end
