> netsh advfirewall reset
> netsh advfirewall set allprofiles state on
> netsh advfirewall firewall delete rule name=all
> netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
# ICMP
> netsh advfirewall firewall add rule name=”ICMP” dir=in action=allow protocol=icmpv4:8,any
> netsh advfirewall firewall add rule name=”ICMP” dir=out action=allow protocol=icmpv4:8,any
# DNS - server local
> netsh advfirewall firewall add rule name=”DNS” dir=out action=allow protocol=udp localport=53 enable=yes profile=any
> netsh advfirewall firewall add rule name=”DNS” dir=in action=allow protocol=udp localport=53 enable=yes profile=any
# DNS - server remote
> netsh advfirewall firewall add rule name=”DNS” dir=out action=allow protocol=udp remoteport=53 enable=yes profile=any
> netsh advfirewall firewall add rule name=”DNS” dir=in action=allow protocol=udp remoteport=53 enable=yes profile=any
# AD/LDAP - in
> netsh advfirewall firewall add rule name=”AD-tcp-in” action=allow protocol=tcp localport=389,445,88,636,135,3268 dir=in 
> netsh advfirewall firewall add rule name=”AD-udp-in” action=allow protocol=udp localport=389,445,88,636,135,123 dir=in 
# AD/LDAP - out
> netsh advfirewall firewall add rule name=AD-tcp-out action=allow protocol=tcp localport=389,445,88,636,135,3268 dir=out
> netsh advfirewall firewall add rule name=AD-udp-out action=allow protocol=udp localport=389,445,88,636,135,123 dir=out 
# RDP - into my other boxes
> netsh advfirewall firewall add rule name=”RDP” dir=out protocol=tcp remoteport=3389 action=allow
> netsh advfirewall firewall add rule name=”RDP” dir=in protocol=tcp remoteport=3389 action=allow
# Logging of Firewall
> netsh advfirewall set allprofiles logging filename \Windows\fw.log
> netsh advfirewall set allprofiles logging maxfilesize 32676
> netsh advfirewall set allprofiles logging droppedconnections enable 
> netsh advfirewall set allprofiles settings inboundusernotification enable

