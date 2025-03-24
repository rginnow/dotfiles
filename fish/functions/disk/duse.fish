function duse --wraps 'du' --description 'List sizes of files and directories in the current directory, in human-readable format'
    command du -sh * 2>/dev/null $argv
end
