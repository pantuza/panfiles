#!/bin/bash

#
# Bash script to configure a network bridge using OpenVSwitch
#


if [ "$#" -ne 1 ]; then
    echo -e "Missing interface name to assign to the bridge";
    exit 1;
fi;

IFACE="$1";

# Creates the bridge br0
sudo ovs-vsctl add-br br0
# Assign $IFACE to the bridge
sudo ovs-vsctl add-port br0 $IFACE


# Shows the ovs configuration
sudo ovs-vsctl show
