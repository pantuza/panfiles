function net-list --description "List all running machines in the given network range"

    set --local argc (count $argv)

    if test $argc -eq 1
        sudo nmap -sP $argv[1]
    else
        echo "Usage: net-list <CIDR>"
        echo "Example: net-list 192.168.0.0/24"
    end
end
