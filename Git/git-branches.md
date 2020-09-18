---
---

# git branches

In git, branches are simply `pointer`s to the `commit`s, if it is removed, it is removed, no-showing in `git-log`.

It is like nick **name**s on `commit`s, equivalent with `tag`s.


## list branches

```
git branch -avv     # both local & remote, alonging with their detailed information
```

try to find difference among `git branch -a` & `git branch -v` & `git branch -vv` & `git branch -r` & `git brach -l`

`-a` == `--all`, `-v` =~ `-vv` == `--verbose`, `-r` == `--remote`, `-l` == `--list`


# create branch

## new branch based on current HEAD in local

`git branch <new-branch>` stay on current branch

`git checkout -b <new-branch>` immediately switch to new branch


## new branch based on exist commit in local

`git branch <new-branch> <hash>` or `git branch <new-branch> <tag>` stay on current branch

`git checkout -b <new-branch> <hash>` or `git branch <new-branch> <tag>` immediately switch to new branch


## new branch from remote to local

`git branch --track <new-branch> origin/<base-branch>`

`git checkout --track origin/<base-branch>` use the same name like its remote tracked and switch to it


## make remote track new branch

`git branch -u origin/branch <local-branch>`, `-u` == `--set-upstream-to`

`git push -u origin/branch <local-branch>`, `-u` == `--set-upstream`




# delete branch

link: [`user456814`](https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-locally-and-remotely)


## delete a local branch

```
git branch -d <branch>
git branch -D <branch>  # force-delete un-merged branches
```

## delete a remote branch

```
git push origin -d <branch>
git push origin :<branch>
```

## delete a local remote-tracking branch

```
git branch --delete --remotes <remote>/<branch>
git branch -dr <remote>/<branch>
```


```note
if remote branch is deleted, using `git push` will also delete **local remote-tracking** branch.

otherwise, use `git fetch -p` or `git fetch --prune`,

or similarly, `git remote update` & `git remote prune`
```



