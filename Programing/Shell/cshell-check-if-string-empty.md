---
---

# C Shell check if a string is empty

C Shell doesn't have `test -z` function like in `Bash` to do this type of work.

```shell
set string = '   '

if ( -z "$string" ) then
    echo "empty string"
else
    echo "not empty"
endif

# result will be < not empty >
```

However, if you try; 

```shell
set string = '   '

# without quotes preventing shell interpret
if ( -z $string ) then
    echo "empty string"
else
    echo "not empty"
endif

# you will likely get error
# < if: Missing file name. >
```

If you don't give up, try to use the length;

```shell
set string = '   '

# command < $#string > equals to 1
```


Now, you might ask how the hell can make it work?


SOLUTION: **with the help of unique and special char or label**


```shell
set string = '     '

# IMPORTANT!
# make sure do not use quotes prevent shell interpret
if ( @$string == @ ) then
    echo "empty string"
else
    echo "not empty"
endif

# OR
if ( MY_HELP_LABEL$string == MY_HELP_LABEL ) then
    echo "empty string"
else
    echo "not empty"
endif


# However, this may cause error on string separated by spaces

# shell interpret error
set string = 'can you see the space in between of us'
```

## Final Solution

Use special label, with other commands

```shell
set string = 'no matter what kind of string it is'
set check = `echo "MY_HELP_LABEL  $string" | tr -d ' '`
if ( $check == MY_HELP_LABEL ) then
    echo "empty string"
else
    echo "not empty"
endif
```





