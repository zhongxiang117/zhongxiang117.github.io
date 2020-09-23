---
---

# git rebase

official link: [`git-rebase`](https://git-scm.com/docs/git-rebase)

> Reapply commits on top of another base tip


# showcase

general usage;

```
git rebase [--onto] [base-branch]  [choose-commit-start]  [choose-commit-end]
```


## example 1

if we want the result like

```
     A--B--C  topic  [rebase]         A--B--C  topic
    /                 ===>           /
D--E--F  master               D--E--F  master
```

command line:

```
# apply current branch onto other branch

git checkout topic
git rebase master

OR

git rebase master topic
```

```note
if simply `git rebase` is used, which means `rebase` current branch onto `[upstream]`, which usually is remote `origin/master`.

if no `upstream` is set, warning info will be prompted.
```


## example 2

```
A--B--C--D   master        A--B--C--D   master
    \                               | \
     E--F--G  next     ==>          |  E--F--G  next
      \                              \
       H--I--J  topic                 H--I--J  topic


# command line

git rebase --onto master next topic
```


## example 3

```
A--B--C--D--E--F--G   master

# remove D

A--B--C--E--F--G      master


# command

git rebase --onto [C-hash]  [E-hash]  [G-hash]
```


# git rebase abort

sometime, we may need **undo** it

## rebase active

if you are _on-the-way_ of the rebasing, you can abort it;

`git rebase --abort`

if you are in `interactive` mode, just simply let editor return error message:

* `:cq` exit with errors in `vim`
* delete all its contents


## using hash

```
# if rebase HEAD exists
git reset --hard ORIG_HEAD

# note: ORIG_HEAD will be updated after `git reset' or `git merge'
#       or `git rebase' is executed.


# if not, seek
git reflog      # find hash

git reset --hard [commit-hash]
```

```note
for more about `git-reset`, please read: [`git-redo-commit`](git-redo-commit.html)
```


# Merge branch 'master' of github.com:foo/bar

sometime, in `git-log` history, you will see this type of **merge** info, it is important because it merged the **divergent** branches, however, it is less **informative** due to you actually committed nothing, and also it is confusing.

## reason

it happens when your `local` diverges with `remote`, and you then `pull` merged the `remote`, it is a commit showing the `merge-point`.

for example, 

```
                # starting point
                    o-o-o-A
                 /           \
                ^             ^
o-o-o-A--B--C                   o-o-o-A--D--E
    #local                          #remote
```

they diverged at `A`. At this time, if you `git-pull`ed remote in your local, then you will a history like;

```
        B--C
       /    \
o-o-o-A      MERGE    #local
       \    /
        D--E    #remote
```

**it happens you committed local, causing the diverges with your remote first, however then you still pulled your remote**


## fix

use the `git pull --rebase` instead.

the command works that it will **always** put the remote at the **starting** of the _up-to-date_ commit, and put your divergent local commits **appending** to the end.


if the `git pull -rebase` is executed,


```
  # first step, rebase remote commits on A
         V
o-o-o-A--D--E--B--C     # then appending the local commits
      ^
  # A is the up-to-date point
```


**it works like you firstly pulled your remote, then committed your locals**



# git rebase in depth

A very good document [`git-rebase-in-depth`](https://git-rebase.io/)

```note
in case of any errors, here is a backup file: [`backup-git-rebase-in-depth`](images/git-rebase-in-depth-2020-09-23.html)

All rights belong to the author that link shows.

Also, in here I express my great gratitude to OP for such a helpful and useful document!
```



