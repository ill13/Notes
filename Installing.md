###3 InnoSetup

[UninstallRun]
;Filename: "C:\Users\user\Nextcloud\location\source_code\save_settings_reg\dist\app\remove.ps1"; WorkingDir: "{app}"; Flags: shellexec runhidden

Filename: "powershell.exe";Parameters: "-ExecutionPolicy Bypass -File ""{app}\remove.ps1"""; WorkingDir: {app}; Flags: runhidden

