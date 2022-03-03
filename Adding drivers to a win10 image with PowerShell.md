### Adding drivers to a win10 image with PowerShell [and cmd]

This is a mish-mash of ```PowerShell``` and ```cmd```, however it does work.

Copy your existing USB image key contents to a folder..like ```c:\iso```.

Start PowerShell as admin and enter this:
```powershell
Get-WindowsImage -ImagePath "C:\iso\sources\install.wim"
```

Mount the contents as an image. Verify index matches the output of the previous command. 
```powershell
Mount-WindowsImage -Path C:\mount\ -ImagePath "C:\iso\sources\install.wim" -Index 1
```

If the machine you are using has the drivers you need, you can use the following command to export all of the drivers that are installed. This is pretty powerful in that any or all drivers for **all machines** in your environment can be stuffed into here. This can certainly include printer drivers to alleviate *PrintNightmare* ssues on new installs.

Delete any drivers you don't want or need from the folder after exporting.

```powershell
Export-WindowsDriver –Online -Destination c:\export-drivers
```

Now add the drivers to your image

```powershell
Add-WindowsDriver -Path C:\mount\ -Driver C:\export-drivers -Recurse
```


Once that completes, rebuild the image with this:
```powershell
Dismount-WindowsImage -Path C:\mount\ –Save
```
if above fails, do;

```powershell
Dismount-WindowsImage -Path C:\mount\ –Discard
```

Now split the ```install.wim``` into **FAT32** happy chunks.

```cmd
Dism /Split-Image /ImageFile:C:\iso\sources\install.wim /SWMFile:C:\iso\sources\install.swm /FileSize:3999     
```

Go back into the ```C:\iso\sources\``` folder and move *install.wim* to somewhere else; you won't need it for this tutorial. Keep it accessible because you'll need it if you want to mount your image data again. 

Are you using the "Deployment Tools Command Prompt" found in the start menu?  If you aren't, *oscdimg* will fail

```cmd
oscdimg -n -m -bc:\iso\boot\etfsboot.com C:\iso C:\img_win10_20H2.iso
```

The ```-bc:\iso\boot\etfsboot.com``` part is correct. I don't understand why the command and path have no space [between the ```-b``` and ```c:```]. However, it works as is so I'm not going to worry about it.

Burn with **Rufus**

![image](https://user-images.githubusercontent.com/10509740/156253753-b9f0896a-5f7b-4396-add5-f642a8c87a0d.png)



### Adding drivers to *boot.wim* WIM 

*boot.wim* is where the 'startup drivers' are loaded. If a SATA driver is not available, the ```autoattend.xml``` will fail.

You should have an 'unpacked' ISO from above. In there should be a the *boot.wim*. We are going to mount only that small image with:

```cmd
DISM /Mount-Wim /WimFile:C:\iso\sources\boot.wim /Index:1 /MountDir:C:\mount\
```


At some point you alrady got your SATA drivers from the manufacturer. Put those in *c:\sata_drivers*
```cmd
DISM /Image:C:\mount\ /Add-Driver /Driver:C:\sata_drivers /recurse
```


Commit the changes
```cmd
DISM /Unmount-Wim /MountDir:C:\mount\ /Commit
```

Create a new image
```cmd
oscdimg -n -m -bc:\iso\boot\etfsboot.com C:\iso C:\img_win10_20H2.iso
```

Burn


### Adding drivers to *boot.wim* IMAGE 

*boot.wim* is where the 'startup drivers' are loaded. If a SATA driver is not available, the ```autoattend.xml``` will fail.

You should have an 'unpacked' ISO from above. In there should be a the *boot.wim*. 

We are going to mount only that small *boot.wim* image with:
```cmd
DISM /mount-image /imagefile:C:\iso\sources\boot.wim /index:1 /mountdir:C:\mount\
```

At some point you shoud've downloaded and unpacked the SATA drivers from the manufacturer. Put those in *c:\sata_drivers*

Add them to your *boot.wim* wuth:
```cmd
DISM /Image:C:\mount\ /Add-Driver /Driver:C:\sata_drivers /recurse
```
Commit the changes
```cmd
DISM /unmount-image /mountdir:c:\mount /commit 
```
Create a new image
```cmd
oscdimg -n -m -bc:\iso\boot\etfsboot.com C:\iso C:\img_win10_20H2.iso
```

Burn

