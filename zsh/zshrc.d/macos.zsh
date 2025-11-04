# -------------------------
# MACOS SPECIFIC CONFIGURATION
# -------------------------

# Install Homebrew if not installed
if [[ ! $(command -v brew &> /dev/null) -eq 0 ]]; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Set the Homebrew cask options
export HOMEBREW_CASK_OPTS="appdir='$HOME/Applications'"

# Cache the Homebrew shell environment
if [[ ! -f "$XDG_CACHE_HOME/zsh/brew_init.zsh" ]]; then
    command brew shellenv > "$XDG_CACHE_HOME/zsh/brew_init.zsh"
fi

source "$XDG_CACHE_HOME/zsh/brew_init.zsh"

# Load Laravel Herd if installed
if [[ -d "/Applications/Herd.app" ]]; then
    export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/" \
           HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/" \
           HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/" \
           NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"

    # add Herd bin directory
    typeset -U path PATH
    path+=(
        "$HOME/Library/Application Support/Herd/bin"
    )
fi

# Initialize Orbstack CLI commands and completions
if [[ -f "$HOME/.orbstack/shell/init.zsh" ]]; then
    source "$HOME/.orbstack/shell/init.zsh" 2>/dev/null || :
fi
