#!/usr/bin/env bash

function cmd_exists() {
    type "$1" &> /dev/null
}

function psgrep() {
    ps aux | { \
        read -r; # reads the first line of input \
        printf '%s\n' "$REPLY"; # print the first line of input (=the header) \
        grep "$@"; # then grep gets to grep the remaining lines. \
    } | tail -n +2
}

function process_exists() {
  local count
  count="$(psgrep "$1" | wc -l)"

  if ((count > 0)); then
    echo true
  else
    echo false
  fi
}
