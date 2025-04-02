function lnew -w laravel -d "Create and cd into a new Laravel project" -a dirname
    cd $SITES

    if test -d "$dirname"
        echo "$dirname already exists. Try again."
        exit 1
    end

    laravel new $dirname
    cd $dirname
end
