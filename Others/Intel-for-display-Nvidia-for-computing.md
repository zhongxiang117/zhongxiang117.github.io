---
---

# Intel for display, Nvidia for computing

here are some useful posts:


from [@wangruihui](https://gist.github.com/wangruohui/bc7b9f424e3d5deb0c0b8bba990b1bc5)

works like a charm, but be aware of that make sure any packages starting with `nvidia-*` or library `libnvidia*` are completely removed from your system, otherwise, unknown errors will happen in the following step(s).


to execute:

```sh
sudo apt purge nvidia*

# double check
dpkg -l | grep nvidia

apt list --installed | grep nvidia

# for any of those outputs
sudo dpkg -P <libnvidia*>
sudo apt purge <libnvidia*>

# then follows the post steps
```

for detail reference, `lspci` results:

```
lspci | grep VGA

#outputs:

00:02.0 VGA compatible controller: Intel Corporation Device 4c8a (rev 04)
01:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 730] (rev a1)
```

here is my setting for file `/etc/X11/xorg.conf`

```
# File: /etc/X11/xorg.conf
# Date: Mar 30, 2022

Section "ServerLayout"
    Identifier     "Layout0"
    Screen      0  "Screen0"
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
EndSection

Section "Files"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/psaux"
    Option         "Emulate3Buttons" "no"
    Option         "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Keyboard0"
    Driver         "kbd"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "Device0"
    Driver         "modesetting"
    VendorName     "Intel Corporation"
    BusID   	   "PCI:0:2:0"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection
```

## other resource

from [@litaotj](http://litaotju.github.io/2019/03/13/=Use-intel-for-display-nvidia-for-computing/)

(I did not test this post, but it worths for reading)


## common errors

```
NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver.
Make sure that the latest NVIDIA driver is installed and running
```

it has three reasons:

1. secure boot is enabled, which caused module unsigned

check whether `secure boot` is on or not, `mokutils --sb-state`. If it is enabled, turn off it in `BIOS` setting, and reboot.

2. module is blacklisted

check whether files exist at path `/lib/modprobe.d/blacklist-nvidia*` or `/etc/modprobe.d/blacklist-nvidia*`, if it does, edit to `blacklist nvidia-drm` and `alias nvidia-drm off`.

3. module is incompatible

please search on Google for solution.


### some useful commands

```
# utility for Machine Owner Keys
mokutils

# list all PCI devices
lspci

# show status of kernel modules
lsmod

# show info for kernel modules
modinfo

# list hardware
lshw

# green line extension
glxheads
glxinfo
glxdemo
```




