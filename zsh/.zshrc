# The goal of this .zshrc is to be minimal, but also provide a solid
# foundation for a custom zsh configuration. It is designed to be
# fast, efficient, configurable, and easy to maintain.

# -------------------------
# INITIALIZATION
# This section is responsible for system defaults,
# and anything that may require user input.
# -------------------------

# Ensure XDG directories exist
mkdir -p $XDG_CACHE_HOME $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME

# Pre-build cache directories for common tools
mkdir -p $XDG_CACHE_HOME/{bat,bun,nvim,zsh}

# Convenience variable for platform checks
PLATFORM=$(uname -s)

# Do things specific to MacOS
if [[ "$PLATFORM" = "Darwin" ]]; then
    source $XDG_CONFIG_HOME/zsh/zshrc.d/macos.zsh
fi

# Do things specific to Raspberry Pi/Debian
if [[ "$PLATFORM" = "Linux" ]] && [[ -f "/etc/debian_version" ]]; then
    source $XDG_CONFIG_HOME/zsh/zshrc.d/debian.zsh
fi

# If using Kitty, auto-start tmux
if [[ -z "$TMUX" ]] && [[ "$TERM" = "xterm-kitty" ]]; then
  exec tmux new-session -A -s main && exit;
fi

# -------------------------
# P10k INSTANT PROMPT
# Must come after initialization that may contain console input,
# but before any additional configuration.
# -------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# -------------------------
# CONFIGURE OPTIONS
# Dedicated section for configuring ZSH itself.
# -------------------------

# adjust PATH, ensuring unique entries
typeset -U path PATH
path+=(
    "$HOME/.local/bin/local"
    "$HOME/.local/bin"
)

# Set some ZSH options, including history settings
source $XDG_CONFIG_HOME/zsh/zshrc.d/options.zsh

# Configure completion settings
source $XDG_CONFIG_HOME/zsh/zshrc.d/completions.zsh


# -------------------------
# ZIM FRAMEWORK
# Zim is a ZSH framework that provides speedy configuration
# and management of ZSH plugins. https://zimfw.sh/
# -------------------------

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# Initialize zsh-defer.
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh

# Defer evals and cache the results on first run via the evalcache plugin (clear the cache w/ `_evalcache_clear`).
zsh-defer _evalcache docker completion zsh
zsh-defer _evalcache fnm env --use-on-cd --shell zsh
zsh-defer _evalcache zoxide init zsh

# Not every platform has `--zsh`, so we can only init on Mac for now.
if [[ "$PLATFORM" = "Darwin" ]]; then
    zsh-defer _evalcache fzf --zsh
fi

# -------------------------
# USER CONFIGURATION
# This section does any final user-specific changes.
# -------------------------

# Load personal aliases
[[ -f "$XDG_CONFIG_HOME/zsh/zshrc.d/aliases.zsh" ]] && source $XDG_CONFIG_HOME/zsh/zshrc.d/aliases.zsh

# Prevent accidental git commands outside intended repo
[[ -f "$XDG_CONFIG_HOME/zsh/zshrc.d/gitguard.zsh" ]] && source $XDG_CONFIG_HOME/zsh/zshrc.d/gitguard.zsh


# -------------------------
# P10k PROMPT
# Must be last.
# -------------------------

[[ -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"
