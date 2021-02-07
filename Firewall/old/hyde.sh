#!/bin/sh

#########
# Rules #
#########
# set skip on lo0
# block all
# pass in proto tcp to port { 22 80 }
# pass in proto udp to port { 53 }
# pass in inet proto icmp
# pass out proto { tcp udp } to port { 22 53 80 }
# pass out inet proto icmp

start() {
    pfctl -f /etc/pf.conf
    sleep 5
    echo "" > /etc/pf.conf
    pfctl -f /etc/pf.conf
}
start