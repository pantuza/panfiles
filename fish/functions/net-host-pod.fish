function net-host-ddosify --description "Runs a pin of death test on a server for 5 minutes"

    set --local argc (count $argv)

    if test $argc -eq 1
         sudo ping $argv[1] -s 1024 -f -t 300
    else
        echo "Usage: net-host-pod hostname_or_address"
    end
end
