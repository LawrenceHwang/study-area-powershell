$FileName = 'Get-LoggedOnUser.ps1'
$ScriptPath = Join-Path -Path $PSScriptRoot -ChildPath $FileName

# dot source the function
. $ScriptPath

Describe 'Get-LoggedOnUser Function' {
    Context 'Happy path - local computer' {
        Mock -CommandName 'Get-CimInstance' -MockWith { @{username = 'pocky' } }
        It 'Get-LoggedOnUser should return correct user' {
            (Get-LoggedOnUser).LoggedOnUser | Should -Be 'pocky'
        }
    }
    Context 'Happy path - remote computer' {
        Mock -CommandName 'Test-Connection' -MockWith { $true }
        Mock -CommandName 'Get-CimInstance' -MockWith { @{username = 'coffee' } } -ParameterFilter {$ComputerName -eq 'coldbrew'}
        $ComputerName = 'coldbrew'
        It 'Get-LoggedOnUser should return correct user' {
            (Get-LoggedOnUser -ComputerName $ComputerName -verbose).LoggedOnUser | Should -Be 'coffee'
        }
    }
    Context 'Sad Path' {
        It 'Should throw when passing in null computername' {
            $ComputerName = $null
            { Get-LoggedOnUser -ComputerName $ComputerName } | Should -Throw
        }
        It 'LoggedOnUser value should be N/A when remote computer unreachable' {
            Mock -CommandName 'Test-Connection' -MockWith { $false }
            $ComputerName = 'n0c0mput3r3'
            (Get-LoggedOnUser -ComputerName $ComputerName).LoggedOnUser | Should -Be 'N/A'
        }
    }
}
