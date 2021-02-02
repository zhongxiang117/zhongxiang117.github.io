---
---

# Completely remove Samba for a clean install


have a look on this thread: [completely-remove-samba](https://askubuntu.com/questions/74838/how-do-i-completely-remove-samba)


my system is Ubuntu, kernel info;

```
uname -a

# Linux Xiang 5.4.0-26-generic #30-Ubuntu SMP Mon Apr 20 16:58:30 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

commands to remove Samba;


```
sudo apt purge samba smbclient libsmbclient
sudo apt purge samba-common samba-common-bin samba-dsdb-modules samba-libs
sudo apt autoremove


# samba local files
sudo rm -rf /var/cache/samba /etc/samba /run/samba /var/lib/samba /var/log/samba

# check
sudo dpkg -l | grep 'samba\|smb'
```


clean install;

```
sudo apt install samba

# firewall rule (it may be automatically created)
sudo ufw allow samba

# add new user
sudo smbpasswd -a username


# configure
#
##sudo vi /etc/samba/smb.conf
#
## At the bottom of this file, add following lines:
#
##[share-name]
##    comment = Samba on Ubuntu
##    path = /home/username/FOLDER
##    read only = no
##    browsable = yes


# restart service whenever new entry is added
sudo service smbd restart
```