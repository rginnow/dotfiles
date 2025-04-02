dir=`pwd`;
while [ "$dir" != "/" ] ; do
    if  [[ -f "$dir/package-lock.json" ]] && (rg -q '"react":' "$dir/package-lock.json" &> /dev/null); then
        exit 0
    fi
    dir=`dirname "$dir"`;
done
exit 1
