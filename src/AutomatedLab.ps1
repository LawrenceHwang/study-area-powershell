New-LabDefinition -Name 'SALabDemo' -DefaultVirtualizationEngine HyperV
Add-LabMachineDefinition -Name 'DC01' -OperatingSystem 'Windows Server 2019 Datacenter Evaluation (Desktop Experience)' -Roles RootDC -DomainName 'salabdemo.local'
Add-LabMachineDefinition -Name 'Member01' -OperatingSystem 'Windows Server 2019 Datacenter Evaluation (Desktop Experience)' -IsDomainJoined -DomainName 'salabdemo.local'
Install-Lab

$cred = Get-Credential
Enter-PSSession dc01 -Credential $cred
#remove-lab