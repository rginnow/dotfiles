#!/usr/bin/env sh

php -v | rg 'cli' | sed 's/^PHP /v/;s/(cli).*//'
