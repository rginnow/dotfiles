# All variables are universals here. They can be overridden with globals in config.fish

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
    set -q BROWSER; or set -Ux BROWSER open
end

# XDG apps
set -q GNUPGHOME; or set -Ux GNUPGHOME $HOME/.gnupg
set -q LESSHISTFILE; or set -Ux LESSHISTFILE $XDG_DATA_HOME/lesshst
set -q SQLITE_HISTORY; or set -Ux SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
#set -q WORKON_HOME; or set -Ux WORKON_HOME $XDG_DATA_HOME/venvs
#set -q PYLINTHOME; or set -Ux PYLINTHOME $XDG_CACHE_HOME/pylint

# Other vars
set -q FISH_THEME; or set -U FISH_THEME gruvbox_dark
