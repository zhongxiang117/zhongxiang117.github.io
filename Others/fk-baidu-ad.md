---
---

# Baidu: an indecent company in China

There are tons of thousands of complaining/accusing about Baidu immortal behaviors on stealing/misusing users data. Not surprisingly, they also have a lot of sicking doings. I expected that I can get rid of their harasses by using Linux system, apparently I am too naive for such a unrealistic illusion.

I never thought they even pay attention to such tiny irritating thing rather than improve their services.

The thing is that after installed Baidu NetDisk in my Ubuntu system, I always find that my default application for opening `html` or web-oriented files is set to it, no matter how many times that I have tried to change.

After hours searching and learning, I know that the `default application` is defined and controlled by [MIME Types](https://www.baeldung.com/linux/file-mime-types).

Specifically, there is file called `mimeapps.list` in `~/.config` setups all those corresponding file types, which actually has many instances under `XDG_DATA_DIRS` environmental variables in `applications` folders. 

Baidu will add its apps to `mimeapps.list` and make it the highest priority than any other applications, every time it is executed. I've tried many methods, including but not limiting to, change the file permissions, alter the entry sequences, modify or delete the files, or whatever you could image, to stop its annoying action. Fucking retards, none of them work.

I am super curious that why they do such a vexing thing taking grant of that the user will make their apps in the first place? Any idiot will do this? And we, apparently, do not want these stupid changes. Behavior normally, please!

FUCK!


