New-LabDefinition -Name 'SALab' -DefaultVirtualizationEngine HyperV

$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:Gateway'         = '192.168.70.1'
    'Add-LabMachineDefinition:DnsServer1'      = '192.168.70.111'
    'Add-LabMachineDefinition:IsDomainJoined'  = $true
    'Add-LabMachineDefinition:DomainName'      = 'salabdemo.local'
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2019 Datacenter Evaluation (Desktop Experience)'
    'Add-LabMachineDefinition:Network'         = 'SALabNetwork'
}

Add-LabVirtualNetworkDefinition -Name 'SALabNetwork' -AddressSpace '192.168.70.0/24'
Add-LabVirtualNetworkDefinition -Name External -HyperVProperties @{
    SwitchType  = 'External'
    AdapterName = 'Wi-Fi'
}

Add-LabMachineDefinition -Name 'DC01' -Roles RootDC -IpAddress '192.168.70.111'

$netAdapter = @()
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch 'SALabNetwork' -Ipv4Address '192.168.70.1'
$netAdapter += New-LabNetworkAdapterDefinition -VirtualSwitch 'External' -UseDhcp
Add-LabMachineDefinition -Name 'Router01'-Roles Routing -NetworkAdapter $netAdapter

Add-LabMachineDefinition -Name 'Web01' -Roles WebServer -IpAddress '192.168.70.10'

Add-LabMachineDefinition -Name 'Member01'

Install-Lab

#remove-lab
$PSDefaultParameterValues.Clear()