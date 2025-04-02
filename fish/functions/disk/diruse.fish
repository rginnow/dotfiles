function diruse -w du -d 'alias -> du -sh :: Summarize all file/directory sizes within the current directory (human readable)'
    du -sh $argv * 2>/dev/null
end
