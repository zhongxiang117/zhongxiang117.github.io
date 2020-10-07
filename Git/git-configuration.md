---
---

# my git configuration

configure, from the highest precedence to lowest

```
GIT_DIR/.git/config     --local
~/.gitconfig            --global
~/.config/git/config    --global
/etc/gitconfig          --system
```



```
[user]
    name = Xiang Zhong
    email = zhongxiang117@gmail.com


[core]
    # taken in care, windows marks all file as executable
    # set to false to make git ignore `exe' bit changes
    #filemode = false

    editor = vim

    # avoid windows eol `carriage return line feed' error
    autocrlf = input
    safecrlf = true


[remote "origin"]
    url = git+ssh://git@github.com/YOUR_REPOSITORY
    fetch = +refs/heads/*:refs/remotes/origin/*


[branch "master"]
    remote = origin
    merge = refs/heads/master


# color candidates
## normal, black, red, green, yellow,
## magenta, cyan, white, blue
[color "status"]
    added = green
    changed = yellow
    untracked = cyan

[color "branch"]
    current = cyan
    remote = green
    #local = normal
```


## show all configures and their cope

```
git config --list --show-origin --show-scope
```



More talks on [`git-end-of-line`](git-line-ending.html)


More talks on [`git-color`](https://stackoverflow.com/questions/15458237/git-pretty-format-colors#:~:text=The%20git%20config%20documentation%20now,%2C%20magenta%20%2C%20cyan%20and%20white%20.)




