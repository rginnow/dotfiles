# Ensure XDG directories exist
mkdir -p ~/{.config,.cache,.local/share,.local/state}

# Create the zsh cache directory if it doesn't exist
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Homebrew environment
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    export HOMEBREW_CASK_OPTS="appdir='$HOME/Applications'"
    if [[ ! -f "$XDG_CACHE_HOME/zsh/brew_init.zsh" ]]; then
        command brew shellenv > "$XDG_CACHE_HOME/zsh/brew_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/brew_init.zsh"
else
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If using Kitty, auto-start tmux
if [[ -z "$TMUX" ]] && [[ "$TERM" = "xterm-kitty" ]]; then
  tmux attach || exec tmux new-session && exit;
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Check for Laravel Herd
if [[ -d "/Applications/Herd.app" ]]; then
    export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/" \
           HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/" \
           HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/" \
           NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm" \
           PATH="$HOME/Library/Application Support/Herd/bin:$PATH"
fi


# -------------------------
# Configure Options
# -------------------------

source $XDG_CONFIG_HOME/zsh/zshrc.d/options.zsh

source $XDG_CONFIG_HOME/zsh/zshrc.d/completions.zsh

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# -------------------------
# Initialize Zim + Modules
# -------------------------

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
zsh-defer _evalcache fzf --zsh
zsh-defer _evalcache zoxide init zsh

# Orbstack command-line tools and integration
if [[ -d ~/.orbstack ]]; then
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

# -------------------------
# User Configuration
# -------------------------

# Load personal aliases
[[ -f "$XDG_CONFIG_HOME/zsh/zshrc.d/aliases.zsh" ]] && source $XDG_CONFIG_HOME/zsh/zshrc.d/aliases.zsh

# Prevent accidental git commands outside intended repo
[[ -f "$XDG_CONFIG_HOME/zsh/zshrc.d/gitguard.zsh" ]] && source $XDG_CONFIG_HOME/zsh/zshrc.d/gitguard.zsh

# p10k prompt
[[ -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"
