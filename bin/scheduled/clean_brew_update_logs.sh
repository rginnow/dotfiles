#!/bin/sh

# Get the current day of the week (1 = Monday, 7 = Sunday)
DAY_OF_WEEK=$(date +%u)

# Check if it's Monday
if [ "$DAY_OF_WEEK" -eq 1 ]; then
    rm -f "$HOME/.local/bin/local/brew_update_logs.txt"
fi
