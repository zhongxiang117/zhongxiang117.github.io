---
---

# Linux manage users and groups

To list all users in linux, execute `cat /etc/passwd`, file `passwd` contains the essential information required during login.

its format:

```
# format for file: /etc/passwd
# IFS=:     # separated by colon (:)
# in total sever fields

# for example:
xiang:x:1000:1000:xiang,,,:/home/xiang:/bin/bash

# 1:2:3:4:5:6:7
#
# 1: username
# 2: password
# 3: UID (User ID)
# 4: GID (Group ID)
# 5: User ID Info (GECOS), comments, additional info
# 6: HomePath
# 7: Command/shellpath
```

```
passwd              # change password for current user
sudo passwd user    # change password for specified user
sudo passwd         # change password for root

# show info
chage -l user

# check validation and integrity
pwck
```


passwords are saved in `/etc/shadow` file:

```
# format for file: /etc/shadow
# IFS=:     # separated by colon (:)
# in total sever fields

# for example:
xiang:$6$uK/Aw0kgk36CUM1:18984:0:99999:7:::

# 1:2:3:4:5:6:7:8
#
# 1: username
# 2: password
#    $1$ means MD5 encryption
#    $2a$ is Blowfish
#    $2y$ is Blowfish
#    $5$ is SHA-256
#    $6$ is SHA-512
# 3: days since last time password changed, since Jan 1, 1970
# 4: minimum number of days required between password changes
# 5: maximum number of days that the password is valid
# 6: number of days for warning before the password is to expire
# 7: number of days after password expires that account is disabled
# 8: number of exact days when the account is disabled, since Jan 1, 1970
```


groups are saved in `/etc/group` file:

```
# format for file: /etc/group
# IFS=:     # separated by colon (:)
# in total sever fields

group_name:password:GID:user_list

# user_list: a list of usernames that are members of this group, separate by comma
```

command `getent` (acronym: get entries) is very useful

```
# for example: get all users
getent passwd
```

some useful commands may relate to this subject

* [mknod](https://wiki.linuxquestions.org/wiki/Mknod)
* [mknod](https://man7.org/linux/man-pages/man2/mknod.2.html)


# create restricted group/user in linux

read: [sshd_config](https://man.openbsd.org/sshd_config)

setup procedures:

* [https://www.techrepublic.com/article/how-to-restrict-server-users-to-a-specific-directory-in-linux/](https://www.techrepublic.com/article/how-to-restrict-server-users-to-a-specific-directory-in-linux/)

* [https://fedingo.com/how-to-restrict-ssh-users-to-specific-folder/](https://fedingo.com/how-to-restrict-ssh-users-to-specific-folder/)



```note
if any login error happens, check file `/var/log/auth.log` for detail info.
```


