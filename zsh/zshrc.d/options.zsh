# -------------------------
# ZSH OPTIONS
# -------------------------

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# History Settings
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTDUP=erase

# History options
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# Set specific highlight rules
zle_highlight+=(paste:none)
