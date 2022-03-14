# Powershell bits

### Run a script -and you are already in an elevated shell?

```PowerShell.exe -ExecutionPolicy UnRestricted -File script.ps1```

You could globally change execution policy, but that's like running as root all the time


***
### Make Windows font folder act liek a regular folder
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
