function diruses -w du -d 'alias -> du -hd 2 :: Summarize file/directory sizes (human readable, max depth 1)'
    du -hd 1 $argv
end
