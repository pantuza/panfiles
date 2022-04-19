function net-icmp-sniff --description "Sniffs ICMP traffic using tcpdump"

    set --local argc (count $argv)

    if test $argc -eq 1

        sudo tcpdump -tn -XA -i $argv[1] icmp
    else
        echo "Usage: net-icmp-sniff iface"
    end
end
