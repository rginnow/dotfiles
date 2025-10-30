#!/bin/sh

# Get the current day of the week (1 = Monday, 7 = Sunday)
DAY_OF_WEEK=$(date +%u)

# Exit if not Monday
if [ "$DAY_OF_WEEK" -ne 1 ]; then
    echo "Today is not Monday. Exiting..."
    exit 0
fi

/usr/bin/osascript -e "display notification \"Running homebrew update...\" with title \"Brew Update\""

# Get current date and time in format "YYYY-MM-DD @ HH:MM:SS"
TIMESTAMP=$(date "+%Y-%m-%d @ %H:%M:%S")
echo ""
echo "Executed \"update_brew.sh\" at $TIMESTAMP"
echo ""

# Update Homebrew itself
echo "Updating Homebrew..."
/opt/homebrew/bin/brew update
echo ""

# Check for outdated packages
echo "Checking for outdated packages..."
/opt/homebrew/bin/brew outdated
echo ""

# Upgrade all outdated packages
echo "Upgrading outdated packages..."
/opt/homebrew/bin/brew upgrade
echo ""

# Optional: Upgrade casks (applications) as well
echo "Upgrading outdated casks (applications)..."
/opt/homebrew/bin/brew upgrade --cask
echo ""

echo "Brew update complete!"
echo ""
echo "------------------------------------------------------------------------------"

/usr/bin/osascript -e "display notification \"Homebrew update complete!\" with title \"Homebrew Update\""
