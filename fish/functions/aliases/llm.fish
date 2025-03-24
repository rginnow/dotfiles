function llm --wraps='eza' --description 'List all items, sort by last modified date'
    eza -lghamUF --git --icons=always --sort=modified $argv
end
