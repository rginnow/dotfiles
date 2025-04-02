function showfiles -d 'Show hidden files in Finder'
    if test (uname -s) != Darwin
        echo >&2 "Cannot execute command. MacOS not detected."
        return 1
    end

    defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder
end
