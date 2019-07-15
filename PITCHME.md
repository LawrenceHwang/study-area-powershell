# PowerShell

---
## PowerShell 是萬用瑞士刀
@ul[spaced text-white]
- 腳本語言 (scripting language)
- 系統管理工具 (Admin tool)
- 自動化工具 (Desire State Configuration)
- 測試工具 (Pester, Operational Validation Framework)
- Serverless function (Azure Function, AWS PowerShell Lambda)

---
## PowerShell
@snap[west span-40 text-white]
腳本語言 (scripting language)
@snapend

@snap[east]
```powershell
# This is some code sample
function Get-LoggedOnUser {
    [CmdletBinding()]
    Param(
        [Parameter (Mandatory = $false,
            ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [String[]]$ComputerName
    )
    Process {
        if ($null -eq $ComputerName) {
            $user = (Get-CimInstance -ClassName Win32_computersystem -Property username -ErrorAction Stop).UserName
            $prop = @{
                'Computer'     = $env:COMPUTERNAME
                'LoggedOnUser' = $user
            }
            $obj = New-Object -TypeName PSObject -Property $prop
            $obj
        }
    }
}

```

@snapend

---

@snap[east span-50]
![](assets/img/presentation.png)
@snapend

@snap[south span-100 text-white]
Snap Layouts let you create custom slide designs directly within your markdown.
@snapend

---
@title[Add A Little Imagination]

@snap[north-west h4-white]
#### And start presenting...
@snapend

@snap[west span-55]
@ul[spaced text-white]
- You will be amazed
- What you can achieve
- *With a little imagination...*
- And **GitPitch Markdown**
@ulend
@snapend

@snap[east span-45]
@img[shadow](assets/img/conference.png)
@snapend

---
## Q & A