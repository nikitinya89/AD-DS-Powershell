#Установка ролей
Import-Module ServerManager
Add-WindowsFeature –Name AD-Domain-Services –IncludeAllSubFeature –IncludeManagementTools

#Имя Домена
$Domain_Name = 'domain_1.local'

$Пароль DSRM
$DSRM_password = 'P@$$w0rd'

$Netbios = $Domain_Name.ToUpper().Split(".")[0]
    
Import-Module ADDSDeployment
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName $Domain_Name `
    -DomainNetbiosName $Netbios `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true `
    -SafeModeAdministratorPassword (convertto-securestring $DSRM_password -asplaintext -force)
