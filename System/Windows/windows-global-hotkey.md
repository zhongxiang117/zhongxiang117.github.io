---
---

# Windows Global Hotkey


I can say I am a Keyboard Aficionado, I do rather use mouse only when I am playing the video game, League of Legend. For which, honestly, I haven't touch it for over than six months, the simple reason is I am getting too busy and I also do not have much time left to fiddle with.

Annoying part in windows is that, it does have global hotkey setting to use, which is placed on the application's `property => shortcut -> shortcut key`, however, from my testing, it does not work.

Thus to make `global hotkey` feasible, third party application is a must.

I find `autohotkey`, their official link: [`AutoHotKey`](https://www.autohotkey.com/)

Github link: [`Github-AutoHotKey`](https://github.com/Lexikos/AutoHotkey_L)

It's very easy to use and edit.

Also it seems to like _gnome-type-tweak_ on windows, interesting.

## Code Example

For example, if I want to set a hotkey `Ctrl+Alt+T` to open `wsl.exe` in my windows,

Create a file named with `my-hotkey.ahk`

```
^!T::   ;Ubuntu
Run C:\Program Files\WindowsApps\CanonicalGroupLimited.Ubuntu18.04onWindows_1804.2020.824.0_x64__79rhkp1fndgsc\ubuntu1804.exe
Return
```

to make it work whenever I reboot computer, place this file under `windows-startup` by using `win+R => shell:startup`,

```
C:\Users\USRNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
```

then done, I can use the keyboard `Ctrl + Alt + T` to start Ubuntu terminal.


## Code Explanation

```
^       means       Control
+       means       Shift
!       means       Alt


^!T::   means keybinding, double colon is a must

anything after semicolon is the comments

Run the executable

Return is recommended, otherwise, AutoHotKey will continue looking to below
```

```note
for more its symbol meaning, please refer: [`AutoHotKey-symbol`](https://www.autohotkey.com/docs/Hotkeys.htm)
```



