function nvm --wraps=nvm --description 'Node Version Manager'
    # If NVM_DIR is from Herd
    if test $NVM_DIR = "$HOME/Library/Application Support/Herd/config/nvm"
        # Need to esape the Application Support path for bash
        set -l DIR (string replace ' ' '\ ' $NVM_DIR)
    end

    # Now run it and port it into fish for us to use (yay!)
    bass source $NVM_DIR/nvm.sh --no-use ';' nvm $argv
end
