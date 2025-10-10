# ------------------------------
# ZSH COMPLETION CONFIGURATION
# Helpful Guide: https://thevaluable.dev/zsh-completion-guide-examples/
# ------------------------------

# Create the zsh cache directory if it doesn't exist
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Include more paths
fpath=(
    $XDG_CONFIG_HOME/zsh/completions
    $fpath
)

# before init, modload
zmodload zsh/complist

# init compinit
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"
_comp_options+=(globdots) # include hidden files

# options
setopt ALWAYS_TO_END    # Move cursor to the end of the word if a partial completion is supplied
setopt AUTO_LIST        # Automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD # Complete from both ends of a word
setopt MENU_COMPLETE    # Auto highlight first element

# Pattern style
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# use caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# select from a menu
# zstyle ':completion:*' menu select

# Don't select from a menu - allows use of fzf-tab
zstyle ':completion:*' menu no

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# try matching normally, then case-insensitive, then partial word, then substring
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# ------------------------------
# Simple Completions Configuration
# ------------------------------

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# host completion
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N)/dev/null)"}%%[# ]*}//,/ })'


# -----------------------
# FZF-TAB CONFIGURATION
# See: https://github.com/Aloxaf/fzf-tab/wiki/Configuration
# -----------------------

# set fzf flags instead of using default opts
zstyle ':fzf-tab:*' fzf-flags --layout=reverse

# set some default sizing due to the border
zstyle ':fzf-tab:*' fzf-pad 4

# use tmux popup
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 80 12

# switch groupings with < and >
zstyle ':fzf-tab:*' switch-group '<' '>'

# dynamic preview for cat/bat
if [[ -f "$XDG_CONFIG_HOME/zsh/scripts/batfzf.sh" ]]; then
    zstyle ':fzf-tab:complete:(cat|bat):*' fzf-preview '$XDG_CONFIG_HOME/zsh/scripts/batfzf.sh $realpath'
fi

# directories
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always --group-directories-first $realpath'

# Homebrew
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'HOMEBREW_COLOR=1 brew info $word'

# tldr
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'

# Replay completion definitions
zinit cdreplay -q
