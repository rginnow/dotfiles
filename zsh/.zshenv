# -------------------------
# SET GLOBAL ENV FOR ZSH
# -------------------------

# XDG Directory Configuration - Should work across *nix systems
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"

# Custom Directories
export DOTFILES="$HOME/Code/github/rginnow/dotfiles"
export ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Other
export BROWSER="/Applications/Firefox.app"
export BUN_INSTALL="$HOME/.bun"
export TLRC_CONFIG="$XDG_CONFIG_HOME/tldr/config.toml"
export BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"

# Set the GPG_TTY to be the same as the TTY
# either via the env var or via the tty command.
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# Homebrew environment
if [[ -f "/opt/homebrew/bin/brew" ]] then
  HOMEBREW_CASK_OPTS="appdir='$HOME/Applications'"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export GIT_EDITOR="vim"
else
  export EDITOR='nvim'
  export GIT_EDITOR="nvim"
fi
