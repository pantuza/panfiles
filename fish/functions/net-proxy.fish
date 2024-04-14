function net-proxy --description "Creates a local proxy on port 1337 to a remote host using ssh"

    set --local argc (count $argv)

    if test $argc -eq 1

        ssh -D 1337 -v -C -N $argv[1]
    else
        echo "Usage: net-proxy <host>"
    end
end
