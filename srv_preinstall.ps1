#Disable firewall
Set-NetFirewallProfile -All -Enabled False

#Allow RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 0;
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1;

#Rename Server
Rename-Computer -NewName DC1 -Restart -Force
