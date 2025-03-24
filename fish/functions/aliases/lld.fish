function lld --wraps='eza' --description 'List all items, sort directories first'
    eza -lghamUF --git --icons=always --group-directories-first $argv
end
