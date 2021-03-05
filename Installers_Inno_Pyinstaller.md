### InnoSetup

```script
; This allows app to install in 'Program Files' versus 'Program Files x86'
ArchitecturesInstallIn64BitMode=x64

[UninstallRun]

;Move your uninstall powershell script to your app creation folder, this will run your script as Admin on uninstall
Filename: "powershell.exe";Parameters: "-ExecutionPolicy Bypass -File ""{app}\remove.ps1"""; WorkingDir: {app}; Flags: runhidden

[Registry] 

; This allows the app to elevate itself at runtime
Root: "HKLM"; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: String; ValueName: "{app}\app.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletekeyifempty uninsdeletevalue; MinVersion: 0,6.1 



```


### Pyinstaller

- conda activate base/apps pyinstaller34
- on build copy 'whatever is missing' folder to dist folder
- make sure you are running 64bit python for admin elevation to work. 32bit fails silently
- don't use onefile as to avoid being flagged as a virus
- Checkout onedir too
 - 'onedir' will likely make app seem like virus 
- am using 3.5, but fails

```pyinstaller --noconsole --uac-admin --windowed --icon=app_icon.ico app.py```

```pyinstaller --noconsole --uac-admin --windowed --icon=geofence_icon.ico geoFence.py```


### Icons

```convert geoFence_logo_256x256.png -define icon:auto-resize=16,20,24,28,30,31,32,40,42,47,48,56,60,63,84,256 geofence_icon.ico```
