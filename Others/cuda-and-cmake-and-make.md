---
---

# Cuda unsupported gcc/g++ or incompatible with version 10

Recently, I am trying to develop a GPU supported Python package to maximumly harvest the benefits of GPU fast calculation. To do this type of work, I have tested on the every package that I can find over the internet, mainly focusing on third party packages working like the **wrapper** for `Python-CUDA` programing.

Thanks for those contributors' genius, diligent, and masterpiece works, I have found lots of resources sharing the knowledge on coding (perspective on software) and architecture (perspective on hardware).

Based on my testing, I have made my decision to choose [Numba](https://numba.pydata.org) as my bilingual wrapper, `Python`-and-`C/C++`. However, it does not mean that other packages are not favorable.

Besides, it is also good to know that there are the "mutual-linking" with the Cuda and C compilers, please have a look on it question: [https://stackoverflow.com/questions/6622454/cuda-incompatible-with-my-gcc-version](https://stackoverflow.com/questions/6622454/cuda-incompatible-with-my-gcc-version)

Also, it is good to know that there are modifications of environment variables on `make` commands.. [https://stackoverflow.com/questions/3239343/make-install-but-not-to-default-directories](https://stackoverflow.com/questions/3239343/make-install-but-not-to-default-directories)

..though, I do think I am a middle high-level C/C++ programer.. (awkward happens..)

