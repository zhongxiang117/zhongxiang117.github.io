---
---

# Git Handle Case Sensitive

if you are working on Windows system, and you happen changed the **case** of a file or a folder, and pushed to remote, then your nightmare begins.


## What will happen?

for example, if you have a file with the same name but the different cases in remote, and their contents are different.

```
# in remote, files in different contents

FILE.txt
file.txt
```

then you pulled it to your local **windows** machine. Due to windows is the `case-insensitive` system, **overridden** will happen, finally it seems your system only pulled one of them from the remote.

```
# in local windows machine
# which file is kept depends on the pulling sequence
# the latter will overwrite the former

FILE.txt

OR

file.txt
```

In your windows machine, if you execute `git status`, the warning info will be always prompted, either you have **modified** or have **deleted** files.


## reason

git will abidingly perform your command after the `git status` is executed, depending on its order, it will sequentially compare your local file with the remote repository.

since windows is `case-insensitive`, git will separately compare this file with two different files which is thought by **git**, which apparently will cause differences **between** those three files, `file.txt vs file.txt` & `file.txt vs FILE.txt`.


## fix

choose the correct file that you really want to keep, then use `git-mv` to rename it, or `git-rm` to remove one or both of them.


## for future

obviously, a good habit should be fostered, distinguishing your working to different scenario will help a lot, for example, `coding is the coding`, generally, almost all programing languages require your files' names in the **lower** cases; `noting is the noting`, you can either capitalize only the first word, or capitalize each word, or capitalize all of them, in whatever way you may want, however, please remember this format and keep them consistent in future.


To make `git` permanently solve this kind of misleading, configure your file `core.ignorecase = true`

```warning
`core.ignorecase` only works for git checking, it **cannot** solve the problem for already case-conflicted files. If it is set to `true`, it will make git simply ignore the cases, as a result, for example, if git is looking for `FILE.txt`, it will think `file.txt` is also the expected one, and _label_ it as `FILE.txt` instead, then moving on.
```


