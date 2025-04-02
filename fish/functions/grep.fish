function grep -w grep -d 'alias grep command grep --color=auto --exclude-dir={.git,.hg,.svn}'
    command grep --color=auto --exclude-dir={.git,.hg,.svn} $argv
end
