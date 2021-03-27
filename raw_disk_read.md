Python raw disk read:

```
possible_drives = [
        r"\\.\PhysicalDrive1", # Windows
        r"\\.\PhysicalDrive2",
        r"\\.\PhysicalDrive3",
        "/dev/mmcblk0", # Linux - MMC
        "/dev/mmcblk1",
        "/dev/mmcblk2",
        "/dev/sdb", # Linux - Disk
        "/dev/sdc",
        "/dev/sdd",
        "/dev/disk1", #MacOSX 
        "/dev/disk2",
        "/dev/disk3",
        ]
sector_size = 512
for drive in possible_drives:
    try:
        disk = file(drive,'rb')
        disk.seek(14000*sector_size)
        if "MOMS" in disk.read(7):
            print "MOMS disk found at " + drive
            break
    except:
        pass
        
    ```
        
