function ls --wraps='eza' --description 'List items'
    eza --color=always --icons=always --long --git --no-time --no-user --no-permissions --no-filesize $argv
end
