#! /usr/bin/env bash

# use with fzf-tab to preview files and directories
arg=
files=()
dirs=()

for arg in "$@"; do
    if [ "${arg:0:1}" = "-" ]; then continue; fi
    if [ -d "$arg" ]; then
        dirs+=("$arg")
    elif [ -e "$arg" ]; then
        files+=("$arg")
    fi
done

if [ "${#files[@]}" -gt 0 ] && [ "${#dirs[@]}" -gt 0 ]; then
    printf "\x1B[31m[%s error]: %s\x1B[0m\n" "$0" "Cannot concatenate files and directories"
    exit 1
fi

if [ "${#dirs[@]}" -gt 0 ]; then
    eza -1 --color=always --icons=always "${dirs[@]}"
    exit $?
fi

command bat --color=always --style=numbers --line-range=:500 "$@"
exit $?
