function Get-LoggedOnUser {
    [CmdletBinding()]
    Param(
        [Parameter (Mandatory = $false,
            ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [String[]]$ComputerName
    )
    process {
        if ($null -eq $ComputerName) {
            $user = (Get-CimInstance -ClassName Win32_computersystem -Property username -ErrorAction Stop).UserName
            $obj = [PSCustomObject]@{
                'ComputerName' = $env:COMPUTERNAME
                'LoggedOnUser' = $user
            }
        }
        else {
            foreach ($c in $ComputerName) {
                try {
                    if (Test-Connection -Quiet -ComputerName $c -count 1 -ErrorAction SilentlyContinue | Out-Null) {
                        Write-Verbose -message "Checking the logged on user on $c"
                        $CimSplat = @{
                            ClassName = 'Win32_ComputerSystem'
                            Property = 'username'
                            ComputerName = $c
                            ErrorAction = 'STOP'
                        }
                        $user = (Get-CimInstance @CimSplat).UserName
                    }
                    else {
                        Write-Warning -Message "Computer $c is not reachable on the network or permission denied."
                        throw "Unable to access $c"
                    }
                }
                catch {
                    $obj = [PSCustomObject]@{
                        'ComputerName' = $c
                        'LoggedOnUser' = 'N/A'
                    }
                    Write-Verbose -message "Problem with fetching logged on user info on $c"
                }
            }
        }
        $obj
    }
}