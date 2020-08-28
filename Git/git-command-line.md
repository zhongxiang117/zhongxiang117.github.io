---
sort: 1
---

# git command line

link: [gitcli](https://git-scm.com/docs/gitcli)


### git can take version info

```
git diff v1.0 v.20 <path1> <path2>
```

**version info has to come before the path**


### disambiguating

`--` is used to disambiguate when ambiguous happens (mainly because versions)

For example, in current working-tree it has a file named **HEAD**

`git diff HEAD --`   ==>   means `git-diff` between version `HEAD` and working-tree

`git diff -- HEAD`   ==>   means `git-diff` between file **HEAD** and `index`


### wildcards

protect them from shell interpreting before using

```
git restore *.c      ==> checkout files matching [*.c] in working-tree
git restore \*.c     ==> checkout files matching [*.c] in index
```


### stuck options

```
git foo -oArg            But not   git foo -o Arg
git foo --long-opt=Arg   But not   git foo --long-opt Arg
```


### --cached vs --index

```
--cached        ==> only works for index (no changes at all)
--index         ==> make changes in index as well

--staged        ==> same like --cached
--worktree      ==> worktree only
```