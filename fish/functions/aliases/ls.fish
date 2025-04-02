function ls -w eza -d 'List items, the fancy/proper way'
    eza --color=always --icons=always --long --git --no-time --no-user --no-permissions --no-filesize $argv
end
