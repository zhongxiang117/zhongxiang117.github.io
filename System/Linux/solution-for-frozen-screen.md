---
---

# Frozen Screen

cases very likely happen when Ubuntu unexpected stopping a program.

to make it work normally, the culprit process has to be forcedly stopped.


## solution 1

press `Alt + F2`, type `xkill`, use mouse close it


## solution 2

open terminal, find its `PID`, then `kill [PID]`, by using command `ps aux | grep [program-name]`, showing on **second** column.

note, another feature command `pgrep` is alway available to directly show `PID`.

in wired scenario, this `PID` is not correct one that we want, so better use `top` command to find it.


## solution 3

relog in, by `Alt + Ctrl + F1`, restart the service, `sudo service lightdm restart`





```note
for more, please read: [https://askubuntu.com/questions/4408/what-should-i-do-when-ubuntu-freezes](https://askubuntu.com/questions/4408/what-should-i-do-when-ubuntu-freezes)
```
