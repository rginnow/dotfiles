dir=`pwd`;
while [ "$dir" != "/" ] ; do
    if  [[ -f "$dir/package-lock.json" ]] && (rg -q '"vue":' "$dir/package-lock.json" &> /dev/null); then
        rg --no-heading --no-line-number '"vue":' "$dir/package-lock.json" | sed '1s/.*"vue": "^/v/;s/".*//'
        exit 0
    fi
    dir=`dirname "$dir"`;
done
exit 1
