# PowerShell

## 應用與未來

---
@snap[west span-40]
@img[shadow](assets/img/lawrence.jpg)
@snapend

@snap[east span-60]
## 分享者
@ul[spaced text-white]
- Lawrence Hwang
- Twitter: [CPoweredLion@](https://twitter.com/CPoweredLion)
- 熱愛 PowerShell，從 PowerShell V3 開始使用。
- 連續四年參加北美 PowerShell Summit
@snapend
---
## PowerShell 是萬用瑞士刀
@ul[spaced text-white]
- 腳本語言 (scripting language)
- 系統管理工具 (Admin tool)
- 測試工具 (Pester, Operational Validation Framework)
- 自動化工具 (Desire State Configuration)
- Serverless function (Azure Function, AWS PowerShell Lambda)

---
## PowerShell 是萬用瑞士刀-續
@ul[spaced text-white]
- 快速講古
  - Monad, PS2/3/4/5/6/7(Beta)
- 現在發展狀況 (Open Source, 7 coming)
  - 跨平台 (Windows, MacOS, Linux)

---
@snap[west span-40 text-white]
腳本語言 (scripting language)
- 類物件導向
- .Net
@snapend

@snap[east span-60]
![](assets/img/Get-LoggOnUser.png)
@snapend

---
@snap[west span-40 text-white]
系統管理工具 (Admin tool)
@snapend

@snap[east span-60]
### 例如:

@ul[spaced text-white]
- Registry
- Event Log
- Windows Update
- REST API
- PowerShell Remoting
@snapend

---
## Demo- 查詢 Windows Update client id

```
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\
```
---
## Demo - 查詢與下載 KB

```
Get-KbUpdate -Name KB4057119
Save-KbUpdate -Name KB4057119
```
---
@img[shadow](assets/img/whereisitsold.jpg)

---
## 工欲善其事

@ul[spaced text-white]
- PowerShell 5.1 - Windows 內建
- PowerShell Core 6 - GitHub
- [PowerShell Gallery](https://www.powershellgallery.com/) - 模組
- Visual Studio Code

---

## Demo - Use PowerShell Gallery

[SpeculationControl PowerShell Module](https://www.powershellgallery.com/packages/SpeculationControl/1.0.3)

```
Install-Module -Name SpeculationControl -RequiredVersion 1.0.3
```

---

## Demo - 測試工具, Pester

```
Invoke-Pester
```
---
## Demo - Create a Lab with AutomatedLab

![](assets/img/AutomatedLab.PNG)
---
## Demo - Serverless function with AWS PowerShell Lambda

---
## Q & A

---
Appendix
[Monad Manifesto](https://www.jsnover.com/Docs/MonadManifesto.pdf)
[PowerShell on GitHub](https://github.com/powershell/powershell)
[Pester](https://github.com/pester/Pester)
[AutematedLab](https://github.com/AutomatedLab/AutomatedLab)
[kbupdate](https://github.com/potatoqualitee/kbupdate)
[PowerShell Gallery](https://www.powershellgallery.com/)