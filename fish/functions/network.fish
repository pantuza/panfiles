
function net-arp-sniff --description "Sniffs ARP packets using tcpdump"

    set --local argc (count $argv)

    if test $argc -eq 1

        sudo tcpdump -tn -X -i $argv[1] arp
    else
        echo "Usage: net-arp-sniff iface"
    end
end


function net-http-sniff --description "Sniffs HTTP packets using tcpdump"
    set --local argc (count $argv)

    if test $argc -eq 1

        sudo tcpdump -tn -A -i $argv[1] tcp port http
    else
        echo "Usage: net-http-sniff iface"
    end
end
