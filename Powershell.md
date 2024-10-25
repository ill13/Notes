# Powershell bits

### Run a script -and you are already in an elevated shell?

```PowerShell.exe -ExecutionPolicy UnRestricted -File script.ps1```

You could globally change execution policy, but that's like running as root all the time


***
### Make Windows font folder act like a regular folder
The specialized display of the Fonts folder is caused by the settings in its ```desktop.ini file```. An easy way to disable this functionality is:

1. Open PowerShell as Administrator ```(WinKey+X > PowerShell (Admin))```
2. Navigate to the ```c:\Windows\Fonts``` folder.
3. Execute the following command: ```rename-item desktop.ini desktop.sav```
4. To revert, wxecute the following command: ```rename-item desktop.sav desktop.ini```

***

### Change the Remote Desktop port on a machine

```powershell
$portvalue = XXXX

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "PortNumber" -Value $portvalue 

New-NetFirewallRule -DisplayName 'RDPPORTLatest-TCP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort $portvalue 
New-NetFirewallRule -DisplayName 'RDPPORTLatest-UDP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol UDP -LocalPort $portvalue 
```


## Settign up for Automating tasks in Windows

### Windows Install:
- Install Settings | Optional Features | RSAT Include: ADDS and LWD,
- In powershell, you'll need to run 
  - ```Set-ExecutionPolicy Unrestricted```
  - ```Install-Module -Name ExchangeOnlineManagement```

### VS Code settings:
- open your *settings.json* and add:  ```"powershell.integratedConsole.suppressStartupBanner": true```
- downgrade to powershell 2020.1.0


### Task Scheduler

- If you run a task manually it will stay in the 'running' state in the task scheduler library. Wait until you think your task has finished and then hit F5 to refresh.

- If you want a script to run 'hidden' [with no console window], then make sure *run whether user is logged in or not* is checked. Conversely check *run only when user is logged in* if you'd like to monitor the output


```powershell
#simple powershell script to output some text for testing
$tmp_date = Get-Date -DisplayHint Date
Write-Host "`nTask completed at $($tmp_date)... `n"
```

### Special Notes:

- ```$?``` is the True / False status of the last command
- ```$_``` is the same as Javascript's ```this``` or Python's ```self```
- ```-WarningAction SilentlyContinue``` Supress warnnings
- ```$excluded_users = @("amy","bob","chuck")``` make an array
- ```| Where-Object { $excluded_users -notcontains $_ } ``` exclude items from an array

### Create a directory tree

```
tree /f /a > tree.txt
```

or

```
tree /f /a | clip

```

`| clip` means pipe / copy results to clipboard.


  
