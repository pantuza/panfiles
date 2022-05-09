function net-host-ddosify --description "Runs a distributed denial of service test on a server for 5 minutes"

    set --local argc (count $argv)

    if test $argc -eq 1
        ddosify -d 300 -l waved -n 100000 -t $argv[1]
    else
        echo "Usage: net-host-ddosify hostname_or_address"
    end
end
