#Domain name
$Root_Domain = 'test1.local'

#DSRM password
$DSRM_password = 'P@$$w0rd'

#Site name for a new DC (it should already exist)
$SiteName = 'HQ'

Import-Module ServerManager
Add-WindowsFeature –Name AD-Domain-Services –IncludeAllSubFeature –IncludeManagementTools

#Add domain controller to an existing Domain
Import-Module ADDSDeployment
Install-ADDSDomainController `
  -NoGlobalCatalog:$false `
  -CreateDnsDelegation:$false `
  -Credential (Get-Credential Administrator@$Root_Domain) `
  -CriticalReplicationOnly:$false `
  -DatabasePath "C:\Windows\NTDS" `
  -DomainName $Root_Domain `
  -InstallDns:$true `
  -LogPath "C:\Windows\NTDS" `
  -NoRebootOnCompletion:$false `
  -SiteName $SiteName `
  -SysvolPath "C:\Windows\SYSVOL" `
  -Force:$true `
  -SafeModeAdministratorPassword (convertto-securestring $DSRM_password -asplaintext -force)
