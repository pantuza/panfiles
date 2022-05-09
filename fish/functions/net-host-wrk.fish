function net-host-wrk --description "Runs WRK load test tool on a server for 5 minutes"

    set --local argc (count $argv)

    if test $argc -eq 1
        wrk --threads 512 --connections 1024 --duration 300s --latency $argv[1]
    else
        echo "Usage: net-host-wrk hostname_or_address"
    end
end
