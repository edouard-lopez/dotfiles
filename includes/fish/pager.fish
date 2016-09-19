# PAGER / LESS
function configure
    # Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
    # Less Colors for Man Pages
    set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
    set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
    set -gx LESS_TERMCAP_me \e'[0m'           # end mode
    set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
    set -gx LESS_TERMCAP_so \e'[38;5;016m'\e'[48;5;220m'    # begin standout-mode - info box
    set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
    set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline
end
configure
