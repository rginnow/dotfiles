function nvm_find_nvmrc
    set -l DIR (string replace ' ' '\ ' $NVM_DIR)
    bass source $DIR/nvm.sh --no-use ';' nvm_find_nvmrc
end
