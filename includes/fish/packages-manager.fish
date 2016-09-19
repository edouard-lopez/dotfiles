# APT / APTITUDE
function package_manager
    # DEBIAN/UBUNTU/LINUX MINT
    function pkg-search
       aptitude search $argv;
    end
    function pkg-install
       sudo apt-get install $argv;
    end
    function pkg-remove
       sudo apt-get remove $argv;
    end
    function pkg-clean
       sudo apt-get clean;
    end
    function pkg-autoclean
       sudo apt-get autoclean;
    end
    function pkg-update
       sudo apt-get update $argv;
    end
    function pkg-upgrade
       sudo apt-get upgrade $argv;
    end
    function pkg-upgrade-all
       sudo apt-get dist-upgrade $argv;
    end
    function pkg-show
       aptitude show $argv;
    end
    function pkg-sync
       sudo apt-get update; and sudo apt-get upgrade -y;
    end
    function pkg-sync-all
       sudo apt-get update; and sudo apt-get dist-upgrade;
    end
    function pkg-autoremove
       sudo apt-get autoremove;
    end
    function pkg-clean-all
       sudo apt-get clean; sudo apt-get autoclean; sudo apt-get autoremove;
    end
end
configure
