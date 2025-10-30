#!/bin/sh

# Get the current day of the week (1 = Monday, 7 = Sunday)
DAY_OF_WEEK=$(date +%u)

# Run only on Monday
if [ "$DAY_OF_WEEK" -eq 1 ]; then
    rm -f "$HOME/.local/bin/local/brew_update_logs.txt"
else
    echo "Today is not Monday. Exiting..."
    exit 0
fi

/usr/bin/osascript -e 'display notification "Update log has been wiped." with title "Homebrew Update"'
