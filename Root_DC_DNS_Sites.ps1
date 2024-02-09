#Tree domain name
$name = "domain_2.local"
#Tree domain DNS server's IP-address
$IP = "X.X.X.X"

#Add DNS Conditional Forwarder Zone
Add-DnsServerConditionalForwarderZone `
    -Name $name `
    -ReplicationScope Forest `
    -MasterServers $IP


#Subnet 1
$subnet1 = "X.X.X.X/XX"

#New site name for Default-First-Site-Name
$SiteName1 = "HQ"

<#
#Subnet 2
$subnet2 = "X.X.X.X/XX"
#Second Site
$SiteName2 = "Site 2"

#Subnet 3
$subnet3 = "X.X.X.X/XX"
#Third Site
$SiteName3 = "Site 3"

#Subnet 4
$subnet4 = "X.X.X.X/XX"
#Forth Site
$SiteName4 = "Site 4"
/#>

#Rename default site and add subnet
Get-ADReplicationSite Default-First-Site-Name | Rename-ADObject -NewName $SiteName1
New-ADReplicationSubnet -Name $subnet1 -Site $SiteName1

<#
New-ADReplicationSite -Name $SiteName2
New-ADReplicationSubnet -Name $subnet2 -Site $SiteName2
New-ADReplicationSite -Name $SiteName3
New-ADReplicationSubnet -Name $subnet3 -Site $SiteName3
New-ADReplicationSite -Name $SiteName4
New-ADReplicationSubnet -Name $subnet4 -Site $SiteName4
/#>
