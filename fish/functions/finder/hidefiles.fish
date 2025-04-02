function hidefiles -d 'Hide the normally hidden dotfiles in Finder'
    if test (uname -s) != Darwin
        echo >&2 "Cannot execute command. MacOS not detected."
        return 1
    end

    defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder
end
