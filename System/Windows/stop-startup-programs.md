---
---

# Windows stop startup programs or background processes


```
# search on folders

C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup

# Or open by shell commands, Win+R

shell:startup           # user configures
shell:common startup    # system configures


# regedit key

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run


# services.msc
# turn them off by setting startup type to 'manual'


# ultimately solution by using script

Get-Process -Name process-name* | Stop-Process
Get-Service -DisplayName service-name* | Set-Service -StartupType Manual

# Stop-Service
```

