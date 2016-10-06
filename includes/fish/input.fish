# Ibus/Chinese IME
set -gx GTK_IM_MODULE ibus
set -gx IBUS_ENABLE_SYNC_MODE 1  # IBUS+Pycharm bug (see https://youtrack.jetbrains.com/issue/IDEA-78860)
set -gx QT_IM_MODULE ibus
set -gx XMODIFIERS @im=ibus

function map_printScreen_to_open_contextual_menu
    cmd_exists xmodmap ; and xmodmap -e "keycode 107 = Menu NoSymbol Menu"
end

function start_ibus_ime
  set exists (process_exists ibus-daemon)

  if [ $exists = false ]
    ibus-daemon --single --xim --replace --daemonize
  end
end

map_printScreen_to_open_contextual_menu
start_ibus_ime
