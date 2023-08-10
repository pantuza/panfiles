function net-ipv4-location --description "Looks up an IPv4 location"

    set --local argc (count $argv)

    if test $argc -eq 1

        set --local url "https://ipapi.com/ip_api.php"
        set --local ipv4addr $argv[1]
        curl --silent "$url?ip=$ipv4addr" | jq

    else
        echo "Usage: net-ipv4-location ipv4-addr"
    end
end
