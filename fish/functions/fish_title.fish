function fish_title
    # set -q argv[1]; or set argv fish
    # echo (prompt_pwd): $argv;

    set -l emoji "shell"
    if test "$TERM_PROGRAM" = "ghostty"
        set emoji "👻"
    else if test "$TERM_PROGRAM" = "kitty"
        set emogji "🐈"
    else
        set emoji "🐚"
    end

    echo "$emoji - Fish $FISH_VERSION"
end
