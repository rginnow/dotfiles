# ------------------------------
# ZSH COMPLETION CONFIGURATION
# Helpful Guide: https://thevaluable.dev/zsh-completion-guide-examples/
# ------------------------------

# options
setopt ALWAYS_TO_END    # Move cursor to the end of the word if a partial completion is supplied
setopt AUTO_LIST        # Automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD # Complete from both ends of a word
setopt MENU_COMPLETE    # Auto highlight first element

# Pattern style
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Completion caching
zstyle ':completion:*' use-cache on
zstyle ':zim:completion' dumpfile "$XDG_CACHE_HOME/zsh/.zcompdump"
zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/.zcompcache


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
