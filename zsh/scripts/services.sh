#!/usr/bin/env bash

# Declare array of services and pretty human readable names
declare -a services=(
    "brave"
    "Cursor" # com.apple.TextInputUI.xpc.CursorUiViewService
    "ghostty"
    "kitty"
    "application.ch.protonmail.drive"
    "protonmail.desktop"
    "application.me.proton.pass"
    "raycast"
    "signal-desktop"
    "slack"
    "spotify"
)

declare -a serviceNames=(
    "Brave"
    "Cursor"
    "Ghostty"
    "Kitty"
    "Proton-Drive"
    "Proton-Mail"
    "Proton-Pass"
    "Raycast"
    "Signal"
    "Slack"
    "Spotify"
)

declare -a serviceStatus=()

RED="\033[31m"
GREEN="\033[32m"
ENDCOLOR="\033[0m"

# Get status of all my services
for service in "${services[@]}"
do
	status=$(launchctl list | grep "$service")
	if [[ ! -z $status ]]; then
		serviceStatus+=("active")
	else
		serviceStatus+=("inactive")
	fi
done

for i in "${!serviceStatus[@]}"
do
	# If the current line will exceed the max column with then echo the current line and start a new line
	if [[ i -eq 0 || $((i%2)) -eq 0 ]]; then
        echo -e "$line" | awk '{ printf "  %-22s %-22s %-22s %-22s\n", $1, $2, $3, $4 }'
        line=""
	fi

	# Color the next line green if it's active, else red
	if [[ "${serviceStatus[$i]}" == "active" ]]; then
		line+="${serviceNames[$i]}: ${GREEN}${serviceStatus[$i]}${ENDCOLOR} "
	else
		line+="${serviceNames[$i]}: ${RED}${serviceStatus[$i]}${ENDCOLOR} "
	fi
done

# echo what is left
echo -e "$line" | awk '{ printf "  %-22s %-22s %-22s %-22s\n", $1, $2, $3, $4 }'
