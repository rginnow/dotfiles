#!/bin/sh

# Declare array of services and pretty human readable names
declare -a services=(
    "brave"
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

# Get status of all my services
for service in "${services[@]}"
do
	status=`launchctl list | grep "$service"`
	if [[ ! -z $status ]]; then
		serviceStatus+=("active")
	else
		serviceStatus+=("inactive")
	fi
done

# Maximum column width
#width=$((49-2))
width=80

for i in ${!serviceStatus[@]}
do
	# Next line and next line length
	next="${serviceNames[$i]}: \e[5m${serviceStatus[$i]}"

	# If the current line will exceed the max column with then echo the current line and start a new line
	if [[ i -eq 0 || $((i%2)) -eq 0 ]]; then
        printf "$line" | awk '{ printf "  %-22s %-22s %-22s %-22s\n", $1, $2, $3, $4 }'
        line=""
	fi

	# Color the next line green if it's active, else red
	if [[ "${serviceStatus[$i]}" == "active" ]]; then
		line+="\e[32m\e[0m${serviceNames[$i]}: \e[32m${serviceStatus[$i]}\e[0m "
	else
		line+="\e[32m\e[0m${serviceNames[$i]}: \e[31m${serviceStatus[$i]}\e[0m "
	fi
done

# echo what is left
printf "$line" | awk '{ printf "  %-22s %-22s %-22s %-22s\n", $1, $2, $3, $4 }'
