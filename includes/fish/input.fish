function configure
    # Ibus/Chinese IME
    set -gx GTK_IM_MODULE ibus
    set -gx IBUS_ENABLE_SYNC_MODE 1  # IBUS+Pycharm bug (see https://youtrack.jetbrains.com/issue/IDEA-78860)
    set -gx QT_IM_MODULE ibus
    set -gx XMODIFIERS @im=ibus

    function map_printScreen_to_open_contextual_menu
        xmodmap -e "keycode 107 = Menu NoSymbol Menu"
    end

    function start_ibus_ime
        ibus-daemon --daemonize --replace --xim
    end

    map_printScreen_to_open_contextual_menu
    start_ibus_ime
end
configure
