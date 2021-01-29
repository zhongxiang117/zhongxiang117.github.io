---
---

# UFW & Samba

It's fxxking pain that whenever you want to remotely connect your newly built personal server that you see below information;

> It is available but is not responding to connection attempts.
> 
> A firewall or network security policy on the remote computer might be blocking the connection on port "file and print sharing resource". 
> 
> Make sure that the device or resource (xx.xx.xx.xx) allows incoming connections for File and Printer Sharing Completed 
> 
> Windows Help and Support can provide more information about Windows Firewall. 


After many time and efforts have spent, finally that you know it is not the problem from your connecting laptop, it is the problem from your server/host! It is because that **firewall** blocks your incoming connection! As it is already shown in the top diagnosed message!

FXXK ME!

PLEASE DO IT HARD!


## Solution

### First, check firewall

Have a look at this post [firewall-status](https://askubuntu.com/questions/561/how-do-i-know-if-my-firewall-is-on)

Please be extremely careful that **UFW** is **only** a frontend configuration tool, it cannot show every rules created by `iptables`!!!


some commands;

```
# list all rules
sudo iptables -L


sudo ufw status
sudo ufw enable
sudo ufw disable
```


### Second, setup rules

Have a look at this post [firewall-rules](https://askubuntu.com/questions/36608/ufw-firewall-still-blocking-smb-despite-adding-rules)


simple way;

```
sudo ufw allow samba
sudo ufw allow ssh
```