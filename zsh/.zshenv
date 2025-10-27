# -------------------------
# Set System Variables
# -------------------------

# XDG Base Directory Specification
export XDG_CACHE_HOME="$HOME/.cache" \
       XDG_CONFIG_HOME="$HOME/.config" \
       XDG_DATA_HOME="$HOME/.local/share" \
       XDG_STATE_HOME="$HOME/.local/state" \
       XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share" \
       XDG_RUNTIME_DIR="$TMPDIR/xdg_runtime"

# Customize Zsh-specific Directories
export ZDOTDIR="$XDG_CONFIG_HOME/zsh" \
       ZSH_EVALCACHE_DIR="$XDG_CACHE_HOME/zsh/evalcache" \
       ZSH_COMPDUMP_DIR="$XDG_CACHE_HOME/zsh/compdump"

# Zim Configuration Files
export ZIM_CONFIG_FILE="$ZDOTDIR/.zimrc" \
       ZIM_HOME="$XDG_DATA_HOME/zim"

# Other Package Managers and Directory Customizations
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible" \
       BAT_CONFIG_DIR="$XDG_CONFIG_HOME/bat" \
       BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf" \
       BUN_INSTALL="$XDG_DATA_HOME/.bun" \
       COMPOSER_HOME="$XDG_DATA_HOME/.composer" \
       EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza/" \
       FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/config" \
       GNUPGHOME="$XDG_DATA_HOME/.gnupg" \
       GOPATH="$XDG_DATA_HOME/.go" \
       GOROOT="/opt/homebrew/opt/golang/libexec" \
       HEX_HOME="$XDG_DATA_HOME/.hex" \
       LESSHISTFILE="$XDG_DATA_HOME/.lesshst" \
       MIX_HOME="$XDG_DATA_HOME/.mix" \
       TF_CLI_CONFIG_FILE="$XDG_CONFIG_HOME/terraform/.terraformrc" \
       TF_PLUGIN_CACHE_DIR="$XDG_CACHE_HOME/.terraform.d/plugin-cache" \
       TLRC_CONFIG="$XDG_CONFIG_HOME/tldr/config.toml" \
       USER_BIN_DIR="$HOME/.local/bin"

# Other
export DOTFILES="$HOME/Code/github/rginnow/dotfiles" \
       BROWSER="/Applications/Brave Browser.app"

# Colorization
export CLICOLOR=1 \
       LSCOLORS="Gxfxcxdxbxegedabagacad" \
       LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Set the GPG_TTY to be the same as the TTY
# either via the env var or via the tty command.
if [[ -n "$TTY" ]]; then
  export GPG_TTY="$(tty)"
else
  export GPG_TTY="$TTY"
fi

# Preferred editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
    export EDITOR='vim' \
           GIT_EDITOR="vim"
else
    export EDITOR='nvim' \
           GIT_EDITOR="nvim"
fi

# FZF Color Theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"
