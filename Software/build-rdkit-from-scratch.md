---
---

# build RDKit package from scratch

first download up-to-date package from its Git repository: [https://github.com/rdkit/rdkit](https://github.com/rdkit/rdkit), either `zip` file or `git-repo`.


```
cd RDKIT_ROOT
mkdir build
cd build
cmake ..
make
make install
```

for my system, it has two problems occurred, when `make`ing..


### failed on shared library

```
  Linking CXX shared library ../../lib/libRDBoost.so
/usr/bin/ld: /home/xiang/Applications/pyenv/versions/3.8.3/lib/libpython3.8.a(obmalloc.o):
relocation R_X86_64_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
make[2]: *** [Code/RDBoost/CMakeFiles/RDBoost.dir/build.make:91: lib/libRDBoost.so.1.2016.09.1.dev1] Error 1
make[1]: *** [CMakeFiles/Makefile2:2323: Code/RDBoost/CMakeFiles/RDBoost.dir/all] Error 2
make: *** [Makefile:163: all] Error 2
```

after Googling awhile, I found the solution from this question:

[https://stackoverflow.com/questions/42582712/relocation-r-x86-64-32s-against-py-notimplementedstruct-can-not-be-used-when](https://stackoverflow.com/questions/42582712/relocation-r-x86-64-32s-against-py-notimplementedstruct-can-not-be-used-when)

which is due to `libpython3.8.a` installed by `pyenv`(see above the python path) not a `--enable-shared` object. 

I solved this problem by using the system wide python.


### failed on #include <boost/python/numeric.hpp>

```
  Building CXX object Code/DataStructs/Wrap/CMakeFiles/cDataStructs.dir/DataStructs.cpp.o
/home/xiang/Applications/rdkit-master/Code/DataStructs/Wrap/DataStructs.cpp:18:10: fatal error: boost/python/numeric.hpp: No such file or directory
   18 | #include <boost/python/numeric.hpp>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Code/DataStructs/Wrap/CMakeFiles/cDataStructs.dir/build.make:63: Code/DataStructs/Wrap/CMakeFiles/cDataStructs.dir/DataStructs.cpp.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:2518: Code/DataStructs/Wrap/CMakeFiles/cDataStructs.dir/all] Error 2
make: *** [Makefile:163: all] Error 2
```

this problem is due to the removing of head files of `numeric.hpp` of `boost` since version `1.65`(maybe), thus to solve this problem, either:

* install version `libboost-dev==1.58` (for `Ubuntu` system, for any other OS, please find the corresponding correct package name)
* inside the source codes, modify the header file to `numpy.hpp`

instead of all those things, I proposed a simplest solution: by creating a symbolic link: please refer to this link: [https://github.com/BerkeleyAutomation/meshpy/issues/7](https://github.com/BerkeleyAutomation/meshpy/issues/7)


interestingly, I happen to find a issue report for RDKit at [https://github.com/rdkit/rdkit/issues/1581](https://github.com/rdkit/rdkit/issues/1581), is this problem really fixed??

remember, today's date is `Feb 22, 2022`, and their discussions were on early 2018.


