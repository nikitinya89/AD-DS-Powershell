#Root domain name
$name = "domain_1.local"
#Root domain DNS server's IP-address
$IP = "X.X.X.X"

#Add DNS Conditional Forwarder Zone
Add-DnsServerConditionalForwarderZone `
    -Name $name `
    -ReplicationScope Forest `
    -MasterServers $IP
