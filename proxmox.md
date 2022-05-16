# proxmox.md

## Edit ```sources.list``` to allow updates
Edit the repository list at /etc/apt/sources.list and you also have to comment out the line listed in etc/apt/sources.list.d/pve-enterprise.list.

```bash
nano /etc/apt/sources.list
```
Add this :

```deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription```

Save and exit
```sh
nano /etc/apt/sources.list.d/pve-enterprise.list
```
Comment out the subscription line

## Updates
Execute some standard updates. The ```pveam update``` is to update list of VM / LXC containers offered by turnkey and proxmox.

```
apt update
apt-get upgrade

pveam update

apt install ntfs-3g fuse
apt install parted
```

## Mount an NTFS drive
- Enter ```parted -l``` to see the existing partitions / drives. 
  - In my case, my shucked WDC drive that was internally mounted was at ```/dev/sda```
- Make directory where you'd like to mount your NTFS drive
  -  For example:  ```mkdir /mnt/ntfs```
- Now mount the NTFS drive with ```mount -t ntfs /dev/sda1 /mnt/ntfs```
  - Notice the "1" appended there. That means the first partition

If you only want to temporarily mount the drive, stop at here. If you'd like to keep this drive permanently attached then do the next step.

- Now do ```nano /etc/fstab``` and add ```/dev/sda1 /mnt/ntfs ntfs defaults 0 0```

### Debian 11 lxc install [or any lxc]

- Download the template you'd like to use
- No fucking network, make sure you chose ```DHCP```
- 192.168.0.13/24. Need that /24



## Intel GPU Passthrough for lxc
```ls -l /dev/dri```

```nano /etc/pve/lxc/100.conf```

And add the following

```
lxc.cgroup.devices.allow: c 226:0 rwm
lxc.cgroup.devices.allow: c 226:128 rwm
lxc.mount.entry: /dev/dri dev/dri none bind,optional,create=dir
```
Maybe this if the previous doesn't work
```
lxc.cgroup.devices.allow: c 226:* rwm
lxc.mount.entry: /dev/dri/card0 dev/dri/card0 none bind,optional,create=file
lxc.mount.entry: /dev/dri/renderD128 dev/dri/renderD128 none bind,optional,create=file
```

Execute ```chmod 666 /dev/dri/renderD128``` on the proxmox host



### Add a mountpoint to an LXC: The easy way
```
pct set 100 -mp0 /mnt/ntfs/share/media,mp=/srv/storage/ill13
```

- ```pct``` : A tool that proxmox provides to add / remove things from a ```NNN.conf``` file
- ```set 100``` : refers to which LXC we'd like to change
- ```/mnt/ntfs/share/media``` : My folder on an NTFS drive, as mounted above
- ```/srv/storage/ill13``` : Where I would ike my mountpoint to appear on the mediaserver LXC [JellyFin]

### Add a mountpoint to an LXC: The other way

```nano /etc/pve/lxc/100.conf```


### Install Jellyfin on Debian 11
- Make sure you've setup **GPU passthrough** and **Mountpounts** 
- ```Sudo``` the following commands
```
 apt update &&  apt upgrade -y

 apt install apt-transport-https ca-certificates gnupg2 curl git -y

 wget -O- https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor |  tee /usr/share/keyrings/jellyfin.gpg

echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bullseye main" |  tee /etc/apt/sources.list.d/jellyfin.list

 apt update

 apt install jellyfin -y

 systemctl start jellyfin

 systemctl enable jellyfin
```

- Open ```[Ip Address]:8096``` and follow the prompts.
- If you've already mounted an NTFS drive with your media files you can select them during the initial setup
- 

***
### Variuos links

https://www.datahoards.com/installing-pi-hole-inside-a-proxmox-lxc-container/

https://www.linuxcapable.com/how-to-install-jellyfin-media-server-on-debian-11/

https://ashu.io/blog/media-server-lxc-proxmox/

https://linuxconfig.org/how-to-mount-partition-with-ntfs-file-system-and-read-write-access

https://virtualizeeverything.com/2021/09/28/adding-a-samba-share-to-proxmox-as-storage/

https://www.jamescoyle.net/how-to/2019-proxmox-4-x-bind-mount-mount-storage-in-an-lxc-container


***
## Install and configure Jellyfin LXC [Don't do this]

Follow the prompts to install


Landing Page:    http://192.168.0.249                     
WebDAV:          https://192.168.0.249                    
Jellyfin:        http://192.168.0.249:8096 or https://192.168.0.249:12322              
Web shell:       https://192.168.0.249:12320              
Webmin:          https://192.168.0.249:12321              
SMB/CIFS:        \\192.168.0.249 (ports 139/445)          
SSH/SFTP:        root@192.168.0.249 (port 22)             

Now 201



P```
