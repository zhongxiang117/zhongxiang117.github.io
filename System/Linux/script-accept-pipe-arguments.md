---
---

# Script Accept Pipe Arguments

sometime, we would like a script to have the ability to accept the arguments from `pipe`.

How can we do this?

The solution is to use the `built-in` commands, `cat` or `read`, by default, these two commands will take arguments from `stdin` if no inputs are found from command-line.


## Example

```bash
#!/bin/bash

if [[ -p /dev/stdin ]]; then
    # pipe implement when this file exists
    echo "pipe"
    tmp=$(cat)

    # OR
    #read tmp
else
    echo "command"
    # no pipe, get arguments from command line
    tmp="$@"
fi


echo "$tmp"
```


> `-p /dev/stdin` is `True` when the file exists and is a named `pipe`.


### more advance

inspired by this, without using `xargs` command, we can have the ability to make command "accept" arguments even they are not built with `pipe`.


```bash
#!/bin/bash

# command line usage, to make echo "built" with pipe
echo "Good" | { tmp=$(cat); echo "$tmp"; }
```


