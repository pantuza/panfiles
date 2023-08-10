function net-public-ip --description "Returns this machine public IP"

    set --local url "https://ifconfig.me"
    curl --silent $url
end
