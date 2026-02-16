#!/usr/bin/env bash

# Thanks to despian gist
# https://gist.github.com/enpinzolas/7a32ca2765a69f4d96e81eef711f78bc?permalink_comment_id=5876893#gistcomment-5876893
window_class="AlacrittyDrop"

window_is_minimized() {
  local target="$1"
  [[ -z "$target" ]] && return 1
  kdotool windowstate --is MINIMIZED "$target" >/dev/null 2>&1
}

launch_alacritty() {
  # setsid --fork detaches cleanly so the script can exit immediately
  setsid -f alacritty --class "$window_class" >/dev/null 2>&1

  local wid=""
  # Wait briefly for the new window so we can ensure full width (window rule seemed unreliable here)
  for _ in {1..40}; do
    wid=$(kdotool search --class "$window_class" 2>/dev/null | head -n1)
    if [[ -n "$wid" ]]; then
      kdotool windowsize "$wid" 100% y >/dev/null 2>&1
      break
    fi
    sleep 0.05
  done
}

toggle() {
  window_id=$(kdotool search --class "${window_class}" 2>/dev/null | head -n1)
  focused_window=$(kdotool getactivewindow 2>/dev/null | head -n1)

  case "${window_id}" in
    "")
      # Window not found, launch.
      launch_alacritty
      ;;
    *)
      if window_is_minimized "${window_id}"; then
        # Window minimized, show and focus
        kdotool windowactivate "${window_id}"
      else
        if [[ -n "${focused_window}" && "${window_id}" == "${focused_window}" ]]; then
          # Window active and focused, minimize
          kdotool windowminimize "${window_id}"
        else
          # Window active but unfocused, just focus it
          kdotool windowactivate "${window_id}"
        fi
      fi
      ;;
  esac
}

toggle