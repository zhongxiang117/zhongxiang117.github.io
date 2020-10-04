---
---

# Git Change Branch Name

the branch's name can be directly changed by using:

```
git branch -m

git branch -M   ==   git branch --move --force
```

```note
for more talking about branches, please read [`git-branch`](git-branches.html)
```


alternatively, it has many other options.

## by git merge

merge good commits on master

```
git checkout choose_branch
git merge -s ours --no-commit master
git checkout master
git merge choose_branch
```

it will merge any **additional** commits on branch `choose_branch` to `master` in a way solving possible conflicts use `ours` contents.

```note
for more talking about `-s == --strategy`, please read [`git-merge`](git-merge.html)
```


## by git reset

```
git checkout master
git reset --hard choose_branch
```

```warning
this option should be taken in care, unless you clearly know what you are really doing
```



