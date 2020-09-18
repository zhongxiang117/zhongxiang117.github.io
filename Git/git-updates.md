---
---

# update branches

for `branch`es, please refer to [`git-branches`](git-branches.md).

for local objects, they are stored in `.git/objects/`

for references, they are in `.git/refs/heads/`

for remotes, `.git/refs/remotes/`


## git fetch

link: [`git-fetch`](https://git-scm.com/docs/git-fetch)

```note
it only update the local remote-tracking history, no any influences on the working trees.

whey you checkout/switch to it, which will be showing in a `detached HEAD` state.
```

```
git fetch <remote> <branch>    ==> fetch one/all of branches from the repository

git fetch --all        ==> more power commands
```

```
git fetch --dry-run    ==> perform a demo, but not apply them
```

typical `<refspec>` variable is like:

```
fetch = +refs/heads/*:refs/remotes/origin/*
```

fetch all branches exist in `origin` that refs matches the `refs/heads/*`, and update the corresponding remote-tracking branches in the `ref/remotes/origin/*`, even no **fast-forward** is performed because of the `+` sign is specified (cause it means **force** update).


_special example:_

`git fetch master:` == `git fetch origin master`, means "fetch the master branch but I do not explicitly say what remote-tracking branch to update, only the master branch will be updated.


## git pull

link: [`git-pull`](https://git-scm.com/docs/git-pull)

in default, `git pull` == `git fetch` & `git merge FETCH_HEAD`,

**more:** `git pull --rebase` == `git fetch` & `git rebase FETCH_HEAD`, it does not create the new local tracking history, instead it continues the remote records and moves the current heads on it.


illustration
```
   --A---B---C  (remote origin/master)
 /
D---E---F---G  (local master)



@git pull

   --A---B---C    (remote origin/master)
 /             \
D---E---F---G---H    (local master)      [new commit on H]


@git pull --rebase

D---A---B---C---E'---F'---G'  (local master)    [append local commits on C]
            |
       remote origin/master
```


_usage_:

```
git pull [<options>] [<repository> [<refspec>...]]
```


## git merge

link: [`git-merge`](https://git-scm.com/docs/git-merge)

_usage_:

```
git merge [<options>] [<branch/tag-1> <branch/tag-2> ...]
```


## git push

link: [`git-push`](https://git-scm.com/docs/git-push)

_usage_:

```
git push <remote> <branch>
```


