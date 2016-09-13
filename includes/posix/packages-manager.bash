#!/usr/bin/env bash

# APT / APTITUDE
function package_manager() {
    # DEBIAN/UBUNTU/LINUX MINT
    function pkg-search() { aptitude search "$@"; }
    function pkg-install() { sudo apt-get install "$@"; }
    function pkg-remove() { sudo apt-get remove "$@"; }
    function pkg-clean() { sudo apt-get clean; }
    function pkg-autoclean() { sudo apt-get autoclean; }
    function pkg-update() { sudo apt-get update "$@"; }
    function pkg-upgrade() { sudo apt-get upgrade "$@"; }
    function pkg-upgrade-all() { sudo apt-get dist-upgrade "$@"; }
    function pkg-show() { aptitude show "$@"; }
    function pkg-sync() { sudo apt-get update && sudo apt-get upgrade -y; }
    function pkg-sync-all() { sudo apt-get update && sudo apt-get dist-upgrade; }
    function pkg-autoremove() { sudo apt-get autoremove; }
    function pkg-clean-all() { sudo apt-get clean; sudo apt-get autoclean; sudo apt-get autoremove; }
}
configure
