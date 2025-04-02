function paste -d 'Paste data from clipboard'
    set --local ostype (uname -s)
    if test $ostype = Darwin
        pbpaste
    else if test $ostype = linux
        xsel --clipboard --output
    else
        echo >&2 "Unsupported OS: '$ostype'."
    end
end
