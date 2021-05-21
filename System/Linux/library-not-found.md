---
---

# ld library not found


if a `/usr/bin/ld` problem occurs, which means a package is not found:

error like: `/usr/bin/ld [name]`


## Solution 1: --verbose

(1) show verbose, by using `/usr/bin/ld [name] --verbose`, locate which package is

(2) use the error path, recursively find whether the package is missing or not: `sudo dpkg -l | grep [name]`, then, `sudo dpkg -L [libname]` to locate its path

(3*) if the lib exists, symbolize it

(3*) if the lib not exists, install it


## Solution 2: locate

`locate` works similarly like `find`, but more fast and efficient with the help of database (`updatedb`)


## Solution 3: 

`LD_PRELOAD=lib.so executor`

`LD_DEBUG=files executor`

see [ld configuration](#ld-configuration) for more info


## Appendix

### ld configuration

link: [ld](https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)

`ldconfig`: configure dynamic linker run-time bindings

Note that `ldconfig` will only look at files that are named `lib*.so*` (for regular shared objects) or `ld-*.so*` (for the dynamic loader itself).  Other files will be ignored. The same rule is applied to **symlinks**.


### important files:

```
/lib/ld.so
    Run-time linker/loader.

/etc/ld.so.conf
  File containing a list of directories, one per line, in which to search for libraries.

/etc/ld.so.cache
    File containing an ordered list of libraries found in the directories specified in
    /etc/ld.so.conf, as well as  those  found in the trusted directories.
```


### Bit Numbering & Endianness

link: [bit-numbering](https://en.wikipedia.org/wiki/Bit_numbering)

> In computing, bit numbering is the convention used to identify the bit positions in a binary number or a container of such a value. The bit number starts with zero and is incremented by one for each subsequent bit position.

`Most Significant Byte` vs `Least Significant Byte`: determined by bit position is output/sent first, corresponding left-most and right-most bit, respectively.

```
1-byte       decimal     hex      binary        note
8-bit          18       0x12     00010010     left->right

MSB:    00010010
LSB:    01001000
```


### Executable and Linkable Format

link: [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)

`magical number`: `7f 45 4c 46`: _DEL ELF

commands to analyze: `file`, `objdump`, `readelf`










