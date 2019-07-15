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
            $CimSplat = @{
                ClassName   = 'Win32_ComputerSystem'
                Property    = 'username'
                ErrorAction = 'STOP'
            }
            $user = (Get-CimInstance @CimSplat).UserName
            $obj = [PSCustomObject]@{
                'ComputerName' = $env:COMPUTERNAME
                'LoggedOnUser' = $user
            }
        }
        else {
            foreach ($c in $ComputerName) {
                try {
                    if (Test-Connection -Quiet -ComputerName $c -count 1 -ErrorAction SilentlyContinue) {
                        Write-Verbose -message "Checking the logged on user on $c"
                        $CimSplat = @{
                            ClassName    = 'Win32_ComputerSystem'
                            Property     = 'username'
                            ComputerName = $c
                            ErrorAction  = 'STOP'
                        }
                        $user = (Get-CimInstance @CimSplat).UserName
                        $obj = [PSCustomObject]@{
                            'ComputerName' = $c
                            'LoggedOnUser' = $user
                        }
                    }
                    else {
                        Write-Warning -Message "Computer $c is unreachable on the network."
                        throw
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