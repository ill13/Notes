### Powershell

So you want to run a script -and you are already in an elevated shell?

```PowerShell.exe -ExecutionPolicy UnRestricted -File script.ps1```

You could globally change execution policy, but that's like running as root all the time


***
The specialized display of the Fonts folder is caused by the settings in its ```desktop.ini file```. An easy way to disable this functionality is:

1. Open PowerShell as Administrator ```(WinKey+X > PowerShell (Admin))```
2. Navigate to the ```c:\Windows\Fonts``` folder.
3. Execute the following command: ```rename-item desktop.ini desktop.sav```
4. To revert, wxecute the following command: ```rename-item desktop.sav desktop.ini```

***
