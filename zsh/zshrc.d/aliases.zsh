# File Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls="eza -1 --group-directories-first --color=always --icons=always"
alias ll="eza -lghamUF --group-directories-first --color=always --icons=always --git" # list view: long, group, headers, all, modified, created, file indicators
alias home='cd $HOME'
alias projects="cd $HOME/Code"
alias sites="cd $HOME/Herd"
alias library="cd $HOME/Library"
alias dotfiles="cd $DOTFILES"

# File management with confirmation prompts
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias cpr="cp -R"
alias ln="ln -i"
alias sym="ln -sf -i"

# Simple aliases
alias vim="nvim"
alias copy="pbcopy < "
alias please="sudo !!"
alias path="echo $PATH | tr ':' '\n'"
alias fpath="echo $fpath | tr ':' '\n'"
alias wget="wget --hsts-file=$XDG_CACHE_HOME/.wget-hsts"

# Reset project
alias cleanup="rm -rf node_modules && rm -rf vendor"
alias refresh="cleanup && npm install && composer install --prefer-dist"

# Applications
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# Ansible
alias play="ansible-playbook -i ~/.config/ansible/hosts"

# Artisan
alias tinker="herd tinker"
alias horizon="herd horizon"
alias solo="php artisan solo"
alias migrate="php artisan migrate"
alias test="php artisan test"

# Composer
alias dump="composer dumpautoload"
alias optimize="composer dumpautoload -o"
alias require="composer require"

# Docker
alias dc="docker compose"
alias dcup="docker compose up -d"
alias dcdown="docker compose down"
alias dcexec="docker compose exec"

# Git
# see git/config for specific aliases
alias g="git"
alias prep="git add ."
alias commit="git add . && git commit -m"
alias amend="git add . && git commit --amend --no-edit"
alias logs="git history"
alias nah="git reset --hard && git clean -df"
alias squash="git rebase -i HEAD~"
alias yoink="git cherry-pick"
alias wip="git add . && git commit -m 'wip'"
alias later="git stash -u" # stash all, including untracked files

# TLDR - example based help
alias howdoi="tldr"
alias howto="tldr"

# DUF - filesystem disk space usage
alias df="duf"
alias dfj="duf --json"

# BAT - improved file viewing (like cat)
alias cat="bat"
alias batlog="bat --paging=never -l log" # used with tail -f

# highlighting help messages with bat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# Quick networking checks
alias ping="ping -c 5"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Fuzzy finding with FZF
if command -v fzf &> /dev/null; then
    alias fzfp="fzf --tmux 80% --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
    alias preview="fzf --preview 'fzf-preview.sh {}'"

    alias env="printenv | fzf"
    alias path="echo $PATH | tr ':' '\n' | fzf"
    alias fpath="echo $FPATH | tr ':' '\n' | fzf"
fi

# Use NVM if Herd or NVM is already installed, otherwise use FNM
if ! command -v nvm &> /dev/null; then
    alias nvm="fnm"
fi

# Reload ZSH
function reload() {
    exec zsh
    /usr/bin/clear
}

# function to lookup documentation on cht.sh
function cht() {
  local query="${(j:+:)@}"
  curl -s "cht.sh/$query" | bat --style=plain
}

# function to gauge zsh's startup time
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
