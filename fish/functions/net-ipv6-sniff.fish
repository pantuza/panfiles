function net-ipv6-sniff --description "Sniffs IPv6 traffic using tcpdump"

    set --local argc (count $argv)

    if test $argc -eq 1

        sudo tcpdump -tn -XA -i $argv[1] ip6
    else
        echo "Usage: net-ipv6-sniff iface"
    end
end
