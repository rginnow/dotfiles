#!/usr/bin/env fish

#######################################################
# All fish config files are based on Mattmc3's config #
# https://github.com/mattmc3/fishconf/                #
#######################################################

# set initial working directory
set -g IWD ~/Code


# UTILITIES                                               2025-03-18
# ------------------------------------------------------------------

# Initialize direnv.
if type -q direnv
    direnv hook fish | source
end

# Initalize fzf (fuzzy finder)
if type -q fzf
    if not test -r $__fish_cache_dir/fzf_init.fish
        fzf --fish >$__fish_cache_dir/fzf_init.fish
    end
    source $__fish_cache_dir/fzf_init.fish
end

# Initialize Zoxide (fast directory switching)
if type -q zoxide
    if not test -r $__fish_cache_dir/zoxide_init.fish
        zoxide init fish >$__fish_cache_dir/zoxide_init.fish
    end
    source $__fish_cache_dir/zoxide_init.fish
end

# Initialize laravel helper function
if type -q laravel
    if not test -r $__fish_cache_dir/laravel_init.fish
        laravel completion >$__fish_cache_dir/laravel_init.fish
    end
    source $__fish_cache_dir/laravel_init.fish
end

# Initialize project jumping with prj
# if type -q prj
#     prj --init fish | source
# end


# PROMPT                                                  2025-03-18
# ------------------------------------------------------------------

# Disable new user greeting.
set -g fish_greeting

# disable dir shortening
set -g fish_prompt_pwd_dir_length 0
set -g fish_prompt_pwd_full_dirs 100

# Initialize starship prompt.
if type -q starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
    if not test -r $__fish_cache_dir/starship_init.fish
        starship init fish --print-full-init >$__fish_cache_dir/starship_init.fish
    end
    source $__fish_cache_dir/starship_init.fish

    function starship_transient_prompt_func
        starship module character
    end
    # enable_transience # don't show prompt in command history
    disable_transience # allow the prompt to persist

    # Start prompt at the bottom
    # tput cup 9999 0
end


# THEME                                                   2025-03-18
# ------------------------------------------------------------------

fish_config theme choose $FISH_THEME


# TERMINAL                                                2025-03-18
# ------------------------------------------------------------------

# if test -n "$TERM_PROGRAM"
#     set_term_var TERM_CURRENT_SHELL "fish $FISH_VERSION"
# end


# ALIASES                                                 2025-03-18
# ------------------------------------------------------------------

# shell commands
alias how="tldr"
alias howto="tldr"

# laravel specific
alias a="php artisan"
alias tinker="herd tinker"
alias horizon="php artisan horizon"
alias solo="php artisan solo"
alias migrate="php artisan migrate"
alias mf="php artisan migrate:fresh"
alias mfs="php artisan migrate:fresh --seed"
alias unit="php artisan test"


# LOCAL                                                   2025-03-18
# ------------------------------------------------------------------

if test -r $HOME/.local/fish/config.fish
    source $HOME/.local/fish/config.fish
end
