---
---

# git merge

official link: [`git-merge`](https://git-scm.com/docs/git-merge)

it merges input **commit-hash** to the **current** branch,

```
git merge [options] [merge-hash]
```


## advanced git merge

a very good document:

official link: [`advanced-git-merge`](https://git-scm.herokuapp.com/book/pl/v2/Git-Tools-Advanced-Merging#_advanced_merging)


## git merge-file

official link: [`git-merge-file`](https://git-scm.com/docs/git-merge-file)

useful command

```
git merge-file -p [--[no-]diff3] <file-ours> <file-base> <file-theirs>
```

`-p == --stdout` printout merge results to standout whether using `diff3` style or not, by comparing changes from `base` and `theirs` with `ours`.


### clarification

if a **file's history** (specific on a file) is like,

```
         A---B      ours    (HEAD)
        /
o-o-Base
        \
         A'---C     theirs
```

two branches diverges from `Base`, purely because of the changes on `A`, the merge will be conflicted with.

git will keep three versions of this file, so we can get them accordingly.

```
git show :1:file  >  file-base
git show :2:file  >  file-ours
git show :3:file  >  file-theirs
```

or get actual `HASH`s,

```
git ls-files -u
```

now we can **manually** do the merge until we feel comfortable.

sometime, we may prefer one of those version to other two, we can do,

```
git merge-file -p file-ours file-base file-theirs --ours
```

git use `ours` version to solve conflicts. Working similarly for options `--theirs`.

However, when the `--union` option is chosen, then both `ours` and `theirs` versions will be kept, in a way appending to `common-base` with `ours` first and `theirs` after.

**warning:** any contents in `base` that not contained both in `ours` and `theirs` will be discarded, which means only the `common-base` will be kept for the starting point.


### more examples

if a file's history looks like,

```
         A---B      ours    (HEAD)                      file-ours
        /
o-o-Base -- D       common base with a diverged D       file-base
        \
         A'---C     theirs                              file-theirs
```

if `git merge-file file-ours file-base file-theirs --ours` is executed, then we will get,

```
o-o-Base-A-B
```

if using `git merge-file file-ours file-base file-theirs --theirs`,

```
o-o-Base-A'-C
```

if `git merge-file file-ours file-base file-theirs --union`

```
o-o-Base-A-B-A'-C
```

**Note:** you can see that the diverged `D` in `base` is discarded.

## git merge-base

official link: [`git-merge-base`](https://git-scm.com/docs/git-merge-base)

> Find as good common ancestors as possible for a merge



