function net-ipv4-sniff --description "Sniffs IPv4 traffic using tcpdump"

    set --local argc (count $argv)

    if test $argc -eq 1

        sudo tcpdump -tn -XA -i $argv[1] ip
    else
        echo "Usage: net-ipv4-sniff iface"
    end
end
