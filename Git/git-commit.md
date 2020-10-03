---
---

# git commit

official link: [`git-commit`](https://git-scm.com/docs/git-commit)


## automatic identifying

with option `-a == --all`, the step for `git add` can be omitted, for the files that **git tracked**.

```
# Make changes
## git add changes      (can be omitted)

git commit -a -m "COMMIT MESSAGE"
```


## fix last commits

```
git commit --amend --no-edit

# rough equivalent for

git reset --soft HEAD^
# changes
git commit -c ORIG_HEAD
```

> `-C == --reuse-message`: Take an existing commit object, and reuse the log message and the authorship information (including the timestamp) when creating the commit.
>
> `-c == --reedit-message`: Like -C, but with -c the editor is invoked, so that the user can further edit the commit message.


## empty commit

sometime, if we start a `bare repository` and we want to make it as the starting point, normally, git will not allow do this type of things, because;

> Usually recording a commit that has the exact same tree as its sole parent commit is a mistake.

so the specially option `--allow-empty` is used.

```
git commit --allow-empty -m "COMMIT MESSAGE"
```

then a commit without anything will be created.

```
    real commit
      v
o-o-o-A-[A]
         ^
        empty commit, file contents is same with commit A

# the HASH key of them, definitely, should be different
```


## empty commit message

the message for `git commit` is suggested and default-mandatory, however it can be suppressed.

```
# changes on file
# git add

git commit --allow-empty-message
```

the default editor will be opened, make its contents empty, then the commit without message will be created.


## fixup

it will be helpful to show additional info for `fixup`

```
# fixup files
# git add

git commit -m "FIXING COMMIT MESSAGE" --fixup <pick-need-fixing-HASH>
```

then `git log` will be shown in a way;

```
commit NEW-FIXED-COMMIT (HEAD -> master)
Author: Xiang Zhong <zhongxiang117@gmail.com>
Date:   DATE

    fixup! PICKED-HASH-MESSAGE

    FIXING-COMMIT-MESSAGE

MORE ...
```
