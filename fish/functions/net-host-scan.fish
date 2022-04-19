function net-host-scan --description "Scan a host using nmap"

    set --local argc (count $argv)

    if test $argc -eq 1
        sudo nmap -PN $argv[1]
    else
        echo "Usage: net-host-scan hostname_or_address"
    end
end
