start() {

    # Flush Tables
    iptables -F
    iptables -X

    # Accept by default in case of flush
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    
    # Drop All Traffic If Not Matching
    iptables -A INPUT -j DROP
    iptables -A OUTPUT -j DROP
    
    # For Remote Boxes Test
    sleep 3
    iptables -F
}

start