# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ensure XDG directories exist
mkdir -p ~/{.config,.cache,.local/share,.local/state}

# configure base zsh options (setopt)
source $DOTFILES/zsh/zshrc.d/options.zsh

# Download and initialize Zinit, if it's not there yet
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load powerlevel10k theme
zinit ice depth=1 # git clone depth
zinit light romkatv/powerlevel10k

# Add zsh plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load an nvm plugin if we don't have Herd
[[ ! -d "/Applications/Herd.app" ]] && zinit light lukechilds/zsh-nvm

# Add in snippets
zinit snippet OMZP::git

# configure & load base completions
source $DOTFILES/zsh/zshrc.d/completions.zsh

# load tools
source $DOTFILES/zsh/zshrc.d/tools.zsh

# Load aliases
source $DOTFILES/zsh/zshrc.d/aliases.zsh

# Prevent accidental git commands outside intended repo
[[ -f "$DOTFILES/zsh/zshrc.d/gitguard.zsh" ]] && source $DOTFILES/zsh/zshrc.d/gitguard.zsh

# p10k prompt
[[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"
