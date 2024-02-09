#Domain name
$Domain_Name = 'domain_2.local'

#Root domain name
$Root_Domain = 'domain_1.local'

#DSRM password
$DSRM_password = 'P@$$w0rd'

#Site name for a new DC (it should already exist)
$SiteName = 'HQ'
#$SiteName = ($Domain_Name.Split(".")[0]).Substring(0,1).ToUpper()+($Domain_Name.Split(".")[0]).Substring(1)

#Add Roles and Features
Import-Module ServerManager
Add-WindowsFeature –Name AD-Domain-Services –IncludeAllSubFeature –IncludeManagementTools

$Netbios = $Domain_Name.ToUpper().Split(".")[0]

#Add a new tree domain to an existing forest
Import-Module ADDSDeployment
Install-ADDSDomain `
-NoGlobalCatalog:$false `
-CreateDnsDelegation:$false `
-Credential (Get-Credential Administrator@$Parent_Domain) `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainType "TreeDomain" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NewDomainName $Domain_Name `
-NewDomainNetbiosName $Netbios `
-ParentDomainName $Parent_Domain `
-NoRebootOnCompletion:$false `
-SiteName $SiteName `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true `
-SafeModeAdministratorPassword (convertto-securestring $DSRM_password -asplaintext -force)
