function dud --wraps 'du' --description 'List sizes of files and directories in the current directory, in human-readable format, to a max depth of 1'
    command du -h -d 1 $argv
end
