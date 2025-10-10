# -------------------------
# SET GLOBAL ENV FOR ZSH
# -------------------------

# XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"
export XDG_RUNTIME_DIR="$TMPDIR/xdg_runtime"

# Colorization
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Custom Directories
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
export DOTFILES="$HOME/Code/github/rginnow/dotfiles"

# Other
export BROWSER="/Applications/Firefox.app"
export BUN_INSTALL="$HOME/.bun"
export TLRC_CONFIG="$XDG_CONFIG_HOME/tldr/config.toml"
export BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export NVM_LAZY_LOAD=true

# Set the GPG_TTY to be the same as the TTY
# either via the env var or via the tty command.
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export GIT_EDITOR="vim"
else
    export EDITOR='nvim'
    export GIT_EDITOR="nvim"
fi

# Homebrew environment
if [[ -f "/opt/homebrew/bin/brew" ]] then
    HOMEBREW_CASK_OPTS="appdir='$HOME/Applications'"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check for Laravel Herd
if [[ -d "/Applications/Herd.app" ]]; then
    # Laravel Herd Environment Variables
    export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
    export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
    export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"

    # Set NVM Directory
    export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"
fi

# Set NVM from Homebrew, if not already set by Herd
if [[ -z $NVM_DIR ]] && [[ -d "$(brew --prefix nvm)" ]]; then
    # The will set appropriate exports, directories, and symlinks needed
    [ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
fi

# FZF Color Theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"
