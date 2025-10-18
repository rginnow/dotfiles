# -------------------------
# System Environment Variables
# -------------------------

# XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"
export XDG_RUNTIME_DIR="$TMPDIR/xdg_runtime"

# Customize Shell Directories
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZIM_HOME="$XDG_DATA_HOME/zim"
export ZIM_CONFIG_FILE="$ZDOTDIR/.zimrc"
export ZSH_EVALCACHE_DIR="$XDG_CACHE_HOME/zsh/evalcache"
export ZSH_COMPDUMP_DIR="$XDG_CACHE_HOME/zsh/"

# Other Package Managers and Directory Customizations
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export BUN_INSTALL="$XDG_DATA_HOME/.bun"
export COMPOSER_HOME="$XDG_DATA_HOME/.composer"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza/"
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/config"
export GOPATH="$XDG_DATA_HOME/.go"
export GOROOT="/opt/homebrew/opt/golang/libexec"
export HEX_HOME="$XDG_DATA_HOME/.hex"
export LESSHISTFILE="$XDG_DATA_HOME/.lesshst"
export MIX_HOME="$XDG_DATA_HOME/.mix"
export TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/terraform/.terraformrc"
export TF_PLUGIN_CACHE_DIR="$XDG_CACHE_HOME/.terraform.d/plugin-cache"
export TLRC_CONFIG="$XDG_CONFIG_HOME/tldr/config.toml"

# Other
export DOTFILES="$HOME/Code/github/rginnow/dotfiles"
export BROWSER="/Applications/Brave Browser.app"

# Colorization
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Set the GPG_TTY to be the same as the TTY
# either via the env var or via the tty command.
if [[ -n "$TTY" ]]; then
  export GPG_TTY="$(tty)"
else
  export GPG_TTY="$TTY"
fi

# Preferred editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
    export EDITOR='vim'
    export GIT_EDITOR="vim"
else
    export EDITOR='nvim'
    export GIT_EDITOR="nvim"
fi

# Homebrew environment
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    export HOMEBREW_CASK_OPTS="appdir='$HOME/Applications'"
    if [[ ! -f "$XDG_CACHE_HOME/zsh/brew_init.zsh" ]]; then
        command brew shellenv > "$XDG_CACHE_HOME/zsh/brew_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/brew_init.zsh"
else
    echo "Homebrew not found. Installing..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check for Laravel Herd
if [[ -d "/Applications/Herd.app" ]]; then
    # Laravel Herd Environment Variables
    export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
    export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
    export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"

    # Set NVM Directory
    export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"

    # Set path for CLI tools
    export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"
fi

# FZF Color Theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"
