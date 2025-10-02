# ------------------------------
# ZSH COMPLETION CONFIGURATION
# Helpful Guide: https://thevaluable.dev/zsh-completion-guide-examples/
# ------------------------------

# setup
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# set descriptions format to enable group support for fzf-tab
zstyle ':completion:*:descriptions' format '[%d]'

# try matching normally, then case-insensitive, then partial word, then substring
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# ------------------------------
# GIT CONFIGURATION
# ------------------------------

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false


# -----------------------
# FZF-TAB CONFIGURATION
# See: https://github.com/Aloxaf/fzf-tab/wiki/Configuration
# -----------------------

# use the default fzf options (see fzf/config)
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# set some default sizing due to the border
zstyle ':fzf-tab:*' fzf-pad 4

# use tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 80 12

# switch groupings with < and >
zstyle ':fzf-tab:*' switch-group '<' '>'

# directories
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath'

# Homebrew
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'HOMEBREW_COLOR=1 brew info $word'

# tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
