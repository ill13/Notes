### InnoSetup

```script
; This allows app to install in 'Program Files' versus 'Program Files x86'
ArchitecturesInstallIn64BitMode=x64

[UninstallRun]
;Move your uninstall script to your app creation folder, this will run on exit
Filename: "powershell.exe";Parameters: "-ExecutionPolicy Bypass -File ""{app}\remove.ps1"""; WorkingDir: {app}; Flags: runhidden
```


### Pyinstaller

- conda activate base/apps pyinstaller34
- on build copy 'whatever is missing' folder to dist folder
- make sure you are running 64bit python for admin elevation to work. 32bit fails silently
- don't use onefile as to avoid being flagged as a virus
- Checkout onedir too
- am using 3.5, but fails

```pyinstaller --noconsole --uac-admin --windowed --icon=app_icon.ico app.py```
