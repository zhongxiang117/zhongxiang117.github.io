---
---

# Git Line Ending

due to history reason, for different operation system, it has different line-ending,

* for Windows, it is `\r\n`, _CRLF_ named **carriage return line feeding**
* for Unix, it is `\n`, _LF_ named **line feeding**
* for Mac, it is `\r`, _CR_ named **carriage return**

in order to make `end-of-line` compatible and keep consistent, it comes to `git-autocrlf` setting.

generally speaking, it has two types of `repo`s to handle, the `commit` and `current` (can be checked-out) repositories.


# core.autocrlf

table to show difference:

```
| core.autocrlf |     false    |     input    |     true     |
|---------------|--------------|--------------|--------------|
|               | LF => LF     | LF => LF     | LF => LF     |
|  git commit   | CR => CR     | CR => CR     | CR => CR     |
|               | CRLF => CRLF | CRLF => LF   | CRLF => LF   |
|---------------|--------------|--------------|--------------|
|               | LF => LF     | LF => LF     | LF => CRLF   |
| git checkout  | CR => CR     | CR => CR     | CR => CR     |
|               | CRLF => CRLF | CRLF => CRLF | CRLF => CRLF |
|---------------|--------------|--------------|--------------|
```

**explanations**

* when `core.autocrlf` is set to `input` and `git commit` is executed, if **current** line-ending is `CRLF`, then it will be transferred to `LF`.

* when `core.autocrlf` is set to `true` and `git checkout` is executed, if you are using **windows** system, then the **commit** line-ending `LF` will be transferred to `CRLF`.


```note
No matter what your setting is, your **current-and-early** working tree will not be influenced.
```

# core.safecrlf

`core.safecrlf` only works when `core.autocrlf` is set to `input` or `true`

```
      core.autocrlf     |     input      |     true    
------------------------|----------------|-------------
      git commit        |   CRLF => LF   |   CRLF => LF
------------------------|----------------|-------------
               |  warn  |     Warning    |    Warning  
core.safecrlf  |--------|----------------|-------------
               |  true  |     Fatal      |    Fatal  
```

**explanations**

* when `core.safecrlf` is set to `warn` and `git commit` is executed, if **current** line-ending is `CRLF`, then it will be transferred to `LF`, at the same time, the `warning` message will be prompted like:

```
warning: CRLF will be replaced by LF in <FILEPATH>.
```

* when `core.safecrlf` is set to `true`, any line-ending difference caused by `git commit` & `git checkout` will be rejected, the prompt message will be like:

```
fatal: CRLF would be replaced by LF in <FILEPATH>.
```


```note
Why? Because it will cause inconsistence between files.

For example, if you are using **windows** system, and the line-ending for your working file is `CRLF`, if you set `core.autocrlf = true`, following this setting, `git` will make conversions between your `working-tree` and `commit`.

If it succeeded, then `CRLF` would be transferred to `LF`, however, this behavior is not allowed when `core.safecrlf` is set to `true`, it is like that you are **explicitly** telling `git` that you do not want to make this type of changes, and as a result, `git`, like it always does, will strictly execute your commands.
```
