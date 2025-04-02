dir=`pwd`;
while [ "$dir" != "/" ] ; do
    if  [[ -f "$dir/artisan" && -f "$dir/composer.lock" ]]; then
        rg '\"name\": \"laravel/framework\"' -A1 "$dir/composer.lock" | tail -n 1 | sed '1s/.*: "//;s/".*//'
        exit 0
    fi
    dir=`dirname "$dir"`;
done
exit 1
