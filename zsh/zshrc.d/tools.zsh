# -------------------------
# NVM
# -------------------------

# init NVM from wherever it is
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# init Herd cli
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# load nvm completions
if [[ -d "$(brew --prefix nvm)" ]] && [[ $NVM_DIR != "$HOME/Library/Application Support/Herd/config/nvm" ]]; then
    # nvm from homebrew
    \. "$NVM_DIR/etc/bash_completion.d/nvm"
else
    # nvm from Herd
    \. "$NVM_DIR/bash_completion"
fi

# -------------------------
# FZF
# -------------------------

# init fzf & completions
if type fzf > /dev/null; then
    if [[ ! -f "$XDG_CACHE_HOME/zsh/fzf_init.zsh" ]]; then
        fzf --zsh > "$XDG_CACHE_HOME/zsh/fzf_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/fzf_init.zsh"
fi

# -------------------------
# ZOXIDE
# -------------------------

# init zoxide & completions
if type zoxide > /dev/null; then
    if [[ ! -f "$XDG_CACHE_HOME/zsh/zoxide_init.zsh" ]]; then
        zoxide init zsh > "$XDG_CACHE_HOME/zsh/zoxide_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/zoxide_init.zsh"
fi

# -------------------------
# DOCKER / ORBSTACK
# -------------------------

# Docker Completions
if type docker > /dev/null; then
    if [[ ! -f "$XDG_CACHE_HOME/zsh/docker_init.zsh" ]]; then
        docker completion zsh > "$XDG_CACHE_HOME/zsh/docker_init.zsh"
    fi
    source "$XDG_CACHE_HOME/zsh/docker_init.zsh"
fi

# Orbstack command-line tools and integration
if [[ -d ~/.orbstack ]]; then
    source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi
