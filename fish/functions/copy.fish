function copy -d 'Copy data to clipboard'
    set -l ostype (uname -s)
    if test "$ostype" = Darwin
        if test (count $argv) -eq 0
            cat /dev/stdin | pbcopy
        else
            cat $argv | pbcopy
        end
    else if test $ostype = linux
        if test (count $argv) -eq 0
            cat /dev/stdin | xsel --clipboard --input
        else
            cat $argv | xsel --clipboard --input
        end
    else
        echo >&2 "Unsupported OS '$ostype'."
    end
end
