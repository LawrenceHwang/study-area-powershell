$module = @(
    @{
        Name           = 'PoshGram'
        MinimumVersion = '1.0.2'
    }
    @{
        Name           = 'Pester'
        MinimumVersion = '4.4.2'
    }
)
foreach ($m in $module) {
    if (((Get-Module -Name $m.Name -ListAvailable).version | Select-Object -Last 1) -gt [version]::new($m.MinimumVersion)) {
        Write-Verbose "$($m.Name) does not have minimum version $($m.MinimumVersion). Installing using default settings." -Verbose
        Install-Module -Name PoshGram -Scope CurrentUser -MinimumVersion $m.Version
    }
    else {
        Write-Verbose "$($m.Name) already installed." -Verbose
    }
}

if ($null -eq $cred) {
    $cred = Get-Credential
}
$ChatID = $cred.UserName
$BotToken = ($cred.GetNetworkCredential()).password

$Date = Get-Date

Send-TelegramTextMessage -BotToken $BotToken -ChatID $ChatID -Message "Hi! This is PowerShell Telegram Bot. Time: $Date" -ParseMode Markdown