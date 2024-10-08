function net-loop-curl --description "Loops sending curl GET requests to a remote endpoint and port"

    set --local argc (count $argv)

    if test $argc -gt 0
        while true
            if test $argc -eq 2 # If the user provided a port number
                http --verbose $argv[1]:$argv[2]
            else
                http --verbose $argv[1]
            end
            sleep (math (random 0 100) / 100) # Randomly sleeps for a range of 0 to 1 seconds
            echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
        end
    else
        echo "Usage: net-loop-curl hostname_or_address service_port"
        echo "Example: net-loop-curl localhost 8080"
    end
end
