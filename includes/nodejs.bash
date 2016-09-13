#!/usr/bin/env bash

function configure() {
    function load_nvm() {
        export NVM_DIR="/home/ed8/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    }
    load_nvm;
}
configure
