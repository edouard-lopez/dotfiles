#!/usr/bin/env bash

function configure() {
    # Ibus/Chinese IME
    export GTK_IM_MODULE=ibus
    export IBUS_ENABLE_SYNC_MODE=1  # IBUS+Pycharm bug (see https://youtrack.jetbrains.com/issue/IDEA-78860)
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus


    function map_printScreen_to_open_contextual_menu() {
        cmd_exists xmodmap && xmodmap -e "keycode 107 = Menu NoSymbol Menu"
    }

    function start_ibus_ime() {
        ibus-daemon --daemonize --replace --xim
    }

    map_printScreen_to_open_contextual_menu
    start_ibus_ime
}
configure
