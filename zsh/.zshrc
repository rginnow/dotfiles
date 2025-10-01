# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------
# CONFIGURATION FOR ZSH
# -------------------------

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Create the zsh cache directory if it doesn't exist
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git

# Load completions
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"

# Replay completion definitions
zinit cdreplay -q

# Vim keybindings
bindkey -v

# Set specific highlight rules
zle_highlight+=(paste:none)

# History Settings
HISTFILE="$XDG_CACHE_HOME/zsh/.zsh_history"
HISTSIZE=999999
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
source $DOTFILES/zsh/zshrc.d/aliases.zsh

# init fzf & completions
if type fzf > /dev/null; then
    if [[ ! -f "$XDG_CACHE_HOME/zsh/fzf_init.zsh" ]]; then
        fzf --zsh > "$XDG_CACHE_HOME/zsh/fzf_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/fzf_init.zsh"
fi

# init zoxide & completions
if type zoxide > /dev/null; then
    if [[ ! -f "$XDG_CACHE_HOME/zsh/zoxide_init.zsh" ]]; then
        zoxide init zsh > "$XDG_CACHE_HOME/zsh/zoxide_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/zoxide_init.zsh"
fi

# p10k prompt
[[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"
