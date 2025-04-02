function benchmark -d 'alias -> /usr/bin/time $shell -i -c exit :: benchmark a shell' -a shellname
    test -n "$shellname" || set shellname fish
    echo "running $shellname 10 times..."
    for i in (seq 10)
        /usr/bin/time $shellname -i -c exit
    end
end
