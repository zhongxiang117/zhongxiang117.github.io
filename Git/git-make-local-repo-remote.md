---
---


# Git Make Your Local Repository Remote

Idea got from the post: [`stackoverflow-git-make-local-repo-remote`](https://stackoverflow.com/questions/6648995/how-to-create-a-remote-git-repository-from-a-local-one)


## Remote Repository Has To Be Bare

Better create a new repository (folder) with the `--bare` option. By convention, **bare repository** ends with `.git`.


## Solution


```
mkdir NEW_REPO.git
cd NEW_REPO.git
git init --bare
```

Then this repo is accessible for anyone who has `write & read` permissions.

to link your local repository;

```
# add remote-url as the name of origin

#cd local_repo
git init
git remote add origin PATH_TO/NEW_REPO.git


# The first step is to push your branch to it
#
# why?
#
# Because origin is a bare repository, there is no any branches on it
# you cannot push your contents to an empty repository
# so, you have to push your existing branch to it first and track it latter.

git push -u origin YOUR_LOCAL_BRANCH

# after remote has branches, you can play around of the tracking

git branch -u origin/branch <local-branch>
```

for more, please read: [`git-branches`](git-branches.html)


