function net-host-sniff --description "Sniffs a host traffic using tcpdump"

    set --local argc (count $argv)

    if test $argc -eq 2

        sudo tcpdump -tn -A -i $argv[1] host $argv[2]
    else
        echo "Usage: net-host-sniff iface host"
    end
end
