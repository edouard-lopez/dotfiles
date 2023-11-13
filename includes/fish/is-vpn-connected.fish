function is-vpn-connected
    if ip link show | grep --quiet tun0
        echo "✔"
    else
        echo "✖️"
    end
end
