# All variables are universals here. They can be overridden with globals in config.fish

# Set some special global environment variables
set -q GPG_TTY || set -Ux GPG_TTY (tty)

# Directory shortcuts
set -q SITES || set -Ux SITES "$HOME/Herd"
set -q DOTFILES || set -Ux DOTFILES "$HOME/Code/rginnow/dotfiles"
set -q PROJECT_DIR || set -Ux PROJECT_DIR "$HOME/Code"

# Tool configs
set -q BUN_INSTALL || set -Ux BUN_INSTALL "$HOME/.bun"
set -q TLRC_CONFIG || set -Ux TLRC_CONFIG "$HOME/.config/tldr/config.toml"
set -q EZA_CONFIG_DIR || set -Ux EZA_CONFIG_DIR "$HOME/.config/eza/"

# Set editor variables.
if test -n "$SSH_CONNECTION"
    set -q EDITOR; or set -Ux EDITOR vim
    set -q GIT_EDITOR; or set -Ux GIT_EDITOR vim
else
    set -q EDITOR; or set -Ux EDITOR nvim
    set -q GIT_EDITOR; or set -Ux GIT_EDITOR nvim
end

set -q VISUAL; or set -Ux VISUAL code
set -q PAGER; or set -Ux PAGER less

# Set browser on macOS.
switch (uname -s)
case Darwin
    set -q BROWSER; or set -Ux BROWSER open /Applications/Firefox.app
end

# XDG apps
set -q GNUPGHOME; or set -Ux GNUPGHOME $HOME/.gnupg
set -q LESSHISTFILE; or set -Ux LESSHISTFILE $XDG_DATA_HOME/lesshst
set -q SQLITE_HISTORY; or set -Ux SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
#set -q WORKON_HOME; or set -Ux WORKON_HOME $XDG_DATA_HOME/venvs
#set -q PYLINTHOME; or set -Ux PYLINTHOME $XDG_CACHE_HOME/pylint

# Laravel Herd
set -Ux NVM_DIR "$HOME/Library/Application Support/Herd/config/nvm"
set -Ux HERD_PHP_83_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/83/"
set -Ux HERD_PHP_84_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/84/"

# Other vars
set -q FISH_THEME; or set -U FISH_THEME gruvbox_dark
