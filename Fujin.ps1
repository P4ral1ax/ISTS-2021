netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-In)" dir=in protocol=tcp localport=5985 remoteip=$scoringip action=allow
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-out)" dir=out protocol=tcp localport=5985 remoteip=$scoringip action=allow

netsh advfirewall firewall add rule name="HTTP-in" dir=in protocol=tcp localport=8081 action=allow
netsh advfirewall firewall add rule name="HTTP-out" dir=out protocol=tcp localport=8081 action=allow

netsh advfirewall set allprofiles logging filename $HOME\Pictures\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable