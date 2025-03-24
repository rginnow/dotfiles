function llt --wraps='eza' --description 'List items in a tree, 2 levels deep'
    eza -gTL 2 --git --icons=always $argv
end
