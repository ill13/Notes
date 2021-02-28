### InnoSetup

[UninstallRun]
;Filename: "C:\Users\user\Nextcloud\location\source_code\save_settings_reg\dist\app\remove.ps1"; WorkingDir: "{app}"; Flags: shellexec runhidden

Filename: "powershell.exe";Parameters: "-ExecutionPolicy Bypass -File ""{app}\remove.ps1"""; WorkingDir: {app}; Flags: runhidden



### Pyinstaller

- conda activate base/apps pyinstaller34
- on build copy 'whatever is missing' folder to dist folder
- make sure you are running 64bit python for admin elevation to work. 32bit fails silently
- don't use onefile as to avoid being flagged as a virus
- Checkout onedir too
- am using 3.5, but fails

```pyinstaller --noconsole --uac-admin --windowed --icon=app_icon.ico app.py```
