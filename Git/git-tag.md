---
---

# git tag

official link: [`git-tag`](https://git-scm.com/docs/git-tag)

in total, it has **two** different type of tags, **annotation** and **lightweight**.

> Annotated tags are meant for release while lightweight tags are meant for private or temporary object labels.


## command line

```
git tag [-a | -s | -u <keyid>] [-m <msg>] <tagname> [<commit> | <object>]
```


**explanation of command line**

lightweight `tag` is created without the `-a | -s | -m` option.

```
git tag <tagname>               # lightweight
git tag -a <tagname>            # annotation, the `core.editor' will be opened
git tag -a -m <msg> <tagname>   # annotation, the message will be used
git tag -m <msg> <tagname>      # annotation, behave as if `-a' is passed
```

by default, `-s == --sign` will use your committer identity **Your Email Account** to find the key, which can be configured in: `signingKey = <keyid>`


## list all tags

no matter where you are, the `git tag` will always list all the tags

```
git tag
git tag -l
git tag --list

git tag -l <regExpr>
```


## push tag to remote

```
# push all the tags <not recommend>

git push --tags


# push single tag

git push <tagname>


# push wisely
#
## only annotated tags
## only reachable from the pushed commits
## won't push tags on other branches

git push --follow-tags


# to delete

git push <repo-name> :refs/tags/<tagname>
git push <repo-name> :<tagname>
git push <repo-name> --delete <tagname>
```


## difference between git push --tags & git push --follow-tags

`git push --tags` will push all the tags to remote, even for the tags that are not reachable from the remote. However, `--follow-tags` is more wise and sane, it only pushes the **current branch's trackable** tags.

for example, in your `local` and `remote`, you have a history like;

```
         T1       T2
         v        v
o--o--A--B--o--o--C    (HEAD, master) both on local & remote
       \
        N--o--o--o--M  (dev)          only on local
        ^           ^
        TS1         TS2


# T1, T2 are tags on master branch
# TS1, TS2 are tags on dev branch
```

command `git push --tags` will push all FOUR tags to remote, however, `--follow-tags` will only push `T1` and `T2` to remote.

`--tags` will let remote's `GIT_DIR/refs/tags` have the record for tags `TS1` and `TS2`, even their `HASH` pointing to nowhere (because `dev` does not exist on it). Thus it will pollute the remote tag records, and have the potential issue confusing and interfering other's local tags info.


## git show only annotation tags

```
# only annotation tags will be shown
# lightweight tags in empty line

git tag --format='%(tag)'


# annotation shows "tag"
# lightweight shows "commit"

git for-each-ref


# annotation tag will append ^{}

git show-ref -d
```


## Version format

```

Format      : X.Y.Z[-Stage][.Numeric][+Metadata]


  X         : major     (number)
  Y         : minor     (number)
  Z         : patch     (number)
Stage       : alpha, beta, release candidate
Metadata    : will be ignored when comparing
```

