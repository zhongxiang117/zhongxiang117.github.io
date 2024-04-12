---
---

# Ubuntu Desktop File

```note
**for more**, please read:

[gnome desktop files](https://wiki.archlinux.org/title/desktop_entries)

[unity desktop files](https://help.ubuntu.com/community/UnityLaunchersAndDesktopFiles)
```


linux doesn't have the definition like "start menu"

for ubuntu system, all invoked desktop files are stored under `/usr/share/applications` or `/usr/local/share/applications` or `~/.local/share/applications`, precedence in low to high.

it is convenient to install them by using `vim` (directly editing) or `desktop-file-install` (third party install).

however, it is way too hard to **debug** to make sure they work, cause at most time, they just simply don't work, even they have already been checked by `desktop-file-validate`, because this command **can only** validate the `grammar`, it **does not** have the ability to verify the internal settings. 

here comes up with a workaround to tackle this problem, to print out _debug_ info.

# Redirect Printout

for example, if we have a desktop file, content with:

```
# note: case-sensitive
[Desktop Entry]
Version=1.0
Name=Gauss View
Exec=/path/to/gaussview %F
Icon=/path/to/gaussview-icon %F
Type=Application
Terminal=false
Categories=Development;
```

we modify its `Exec` entry to point to another `executable` file, and use it call the original executor.

```
# note: case-sensitive
[Desktop Entry]
Version=1.0
Name=Gauss View

# here call third executable
Exec=/path/to/desktop-debug-bash

# or you can simply redirect its error info like:
#Exec=/path/to/your-desktopfile 2> /path/to/debugfile

Icon=/path/to/gaussview-icon %F
Type=Application
Terminal=false
Categories=Development;
```

inside this `desktop-debug-bash` file, its content;


```
echo "Desktop-start-debug" > ~/info.txt

/path/to/gaussview >> ~/info.txt 2>&1

echo "Desktop-done-debug" >> ~/info.txt
```


# Debug Procedure

**step 1**, edit original desktop file's executable to another debug file

**step 2**, inside this debug file, redirect printouts & error message to a file

**step 3**, use information in redirect file to debug the original `.desktop`


```warning
interestingly, it seems that `gnome-desktop` utility **cannot** read `environment variables`.
```


# For GNome gedit Chinese encoding problem

Rather than by setting `gsettings set org.gnome.gedit.preferences.encodings auto-detected "['GB18030', 'UTF-8', 'CURRENT', 'ISO-8859-15', 'UTF-16']"`, the simplest solution is to modify its desktop file, where it is stored in `/usr/share/applications/org.gnome.gedit.desktop`, edit line:


```
Exec=gedit --encoding GB18030 %U

# super important!
DBusActivatable=false
```


```warning
Also remove `DBusActivatable=true` (or set it to `false`) if present as it will cause the `Exec` line to be ignored.

check: https://wiki.gnome.org/HowDoI/DBusApplicationLaunching#Changes_to_the_desktop_file
```



