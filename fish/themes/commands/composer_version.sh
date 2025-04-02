composer --version | rg --no-heading --no-line-number 'Composer' | sed 's/version /v/;s/[0-9] .*//'
