---
---

# Warning: Padding of 4 bytes required before ...

fortran does not have the **global variable** to share data among different `subroutines`, thus `COMMON` block will be mostly used.

However, it has restrictions:

> * The common statement should appear together with the variable declarations, before the executable statements.
>
> * Different common blocks must have different names (just like variables).
>
> * A variable cannot belong to more than one common block.
>
> * The variables in a common block do not need to have the same names each place they occur (although it is a good idea to do so), but they must be listed in the same order and **MAY** have the same type and size.

please take a look at the last restriction, word **MAY** (I added), which means if it happens for the parameters in `COMMON` block do not have the same size, in some circumstances for many compilers, the size of the smaller one will be `extended` and `padded` to be comparable with the size of the larger one, and at meanwhile the Warning information: `Padding of 4 bytes required before ...` will be printed out. (value 4 can be any number of size difference...)


## codes to reproduce this warning info

```fortran
      PROGRAM NICE
         COMMON /NOV/ FOO
      END

      SUBROUTINE GOOD
         IMPLICIT NONE
         REAL*8 FOO
         COMMON /NOV/ FOO
      END
```

as you can see, if the above codes are compiled, the `Warning` info will be prompted.

**explanation**

because no `IMPLICIT NONE` is specified, in `PROGRAM NICE`, the size of parameter `FOO` is set to default, **4 Bytes**, however, in `SUBROUTINE GOOD`, its size is explicitly set to `8 Bytes`, therefore, during the compiling, the `FOO` in `NICE` will be **padded** with additional 4 Bytes to match the size in `GOOD`.


**All those warning info is totally acceptable!!**

