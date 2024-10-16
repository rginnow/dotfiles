#!/bin/sh

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

POWERLEVEL10K="$ZSH_CUSTOM/themes/powerlevel10k"
ZSH_AUTOSUGGEST="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
ZSH_SYNTAX="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

if [ ! -d "$POWERLEVEL10K" ]; then
    git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "Powerlevel10k already installed!"
fi

if [ ! -d "$ZSH_AUTOSUGGEST" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "Autosuggest already installed!"
fi

if [ ! -d "$ZSH_SYNTAX" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "Syntax Highlighting already installed!"
fi
