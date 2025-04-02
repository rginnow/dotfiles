dir=`pwd`;
while [ "$dir" != "/" ] ; do
    if  [[ -f "$dir/artisan" && -f "$dir/composer.lock" ]]; then
        exit 0
    fi
    dir=`dirname "$dir"`;
done
exit 1
