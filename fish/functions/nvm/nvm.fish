function nvm
    # Need to esape the Application Support path for bash
    set -l DIR (string replace ' ' '\ ' $NVM_DIR)

    # Now run it and port it into fish for us to use (yay!)
    bass source $DIR/nvm.sh --no-use ';' nvm $argv
end
