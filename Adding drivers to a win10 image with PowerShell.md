### Adding drivers to a win10 image with PowerShell

Copy your USB key contents to a folder
```
Get-WindowsImage -ImagePath "C:\iso\sources\install.wim"
```

Mount the contents as an image. Verify index matches
```
Mount-WindowsImage -Path C:\mount\ -ImagePath "C:\iso\sources\install.wim" -Index 1
```

If the machine you are using has the drivers you need, you can use this to export all of the drivers that are installed.
Delete any drivers you don't want or need from the folder after exporting
```
Export-WindowsDriver –Online -Destination c:\export-drivers
```

Now add the drivers to your image

```
Add-WindowsDriver -Path C:\mount\ -Driver C:\export-drivers -Recurse
```




Once that completesm rebuild the image with this:
```
Dismount-WindowsImage -Path C:\mount\ –Save
```
if above fails, do;

Dismount-WindowsImage -Path C:\mount\ –Discard





Are you using the "Deployment Tools Command Prompt" found in the start menu?  

```
oscdimg -n -m -bc:\ISO\boot\etfsboot.com C:\ISO C:\new_win10pro_image.iso
```
