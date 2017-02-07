
function net-arp-sniff --description "Sniffs ARP packets using tcpdump"

    set --local argc (count $argv)

    if test $argc -eq 1

        sudo tcpdump -tn -X -i $argv[1] arp
    else
        echo "Usage: net-arp-sniff iface"
    end
end
