function cat -w bat -d 'Print and concatenate files (using bat if available)'
    if type -q bat > /dev/null 2>&1
        # Check if bat is installed and available
        command bat $argv
    else if type -q batcat > /dev/null 2>&1
        # batcat is the name of the binary in some distributions
        command batcat $argv
    else
        # Fallback to the standard cat command
        command cat $argv
    end
end
