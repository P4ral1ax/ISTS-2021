#!/bin/sh

###############################
# IPTABLES RULES LOOKUP TABLE #
###############################

start() {

    #################
    # DEFAULT RULES #
    #################

    # Flush Tables
    iptables -F
    iptables -X

    # Accept by default in case of flush
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT

    # Allow ICMP
    iptables -A INPUT -p ICMP -j ACCEPT
    iptables -A OUTPUT -p ICMP -j ACCEPT

    # Allow Loopback
    iptables -A INPUT -i lo -j ACCEPT
    iptables -A OUTPUT -o lo -j ACCEPT

    # Accept SSH
    iptables -A INPUT -p tcp --dport ssh -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

    # Allow DNS Requests
    iptables -A INPUT -p udp --sport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p udp --dport 53 -m state --state ESTABLISHED -j ACCEPT
    iptables -A INPUT -p tcp --sport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A OUTPUT -p tcp --dport 53 -m state --state ESTABLISHED -j ACCEPT

    # Drop All Traffic If Not Matching
    iptables -A INPUT -j DROP
    iptables -A OUTPUT -j DROP

    # Backup Rules
    iptables-save > /etc/ip_rules

    # For Remote Boxes Test case of lockout
    sleep 3
    iptables -F
}

start