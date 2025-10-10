function composer -d "Runs composer with herd if available, otherwise use the system composer"
    if command -v herd > /dev/null
        herd composer $argv
    else if command -v composer > /dev/null
        command composer $argv
    else
        echo "No composer found"
        return 1
    end
end
