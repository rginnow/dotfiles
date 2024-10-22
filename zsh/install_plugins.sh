#!/bin/sh

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

POWERLEVEL10K="$ZSH_CUSTOM/themes/powerlevel10k"
ZSH_AUTOSUGGEST="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
ZSH_SYNTAX="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
ARTISAN="$ZSH_CUSTOM/plugins/artisan"

if [ ! -d "$POWERLEVEL10K" ]; then
    git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "Powerlevel10k Theme already installed!"
fi

if [ ! -d "$ZSH_AUTOSUGGEST" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "ZSH Autosuggestions Plugin already installed!"
fi

if [ ! -d "$ZSH_SYNTAX" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "ZSH Syntax Highlighting Plugin already installed!"
fi

if [ ! -d "$ARTISAN" ]; then
    git clone https://github.com/jessarcher/zsh-artisan.git "$ZSH_CUSTOM/plugins/artisan"
else
    echo "ZSHArtisan Plugin already installed!"
fi
