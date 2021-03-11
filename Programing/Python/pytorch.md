---
---

# PyTorch


## tensor
what is `tensor`: [generalization](https://deeplizard.com/learn/video/Csa5R12jYRg)


excerpt:

> `tensor` is a _n_ dimensional array in computer science, or the tensor in mathematics
> `tensor` does not know how many exponents inside (important!)


## factory function vs construction function

link: [https://www.cnblogs.com/kidsitcn/p/11569803.html](https://www.cnblogs.com/kidsitcn/p/11569803.html)

more detail & vivid: [https://blog.csdn.net/qq_34937637/article/details/80702865](https://blog.csdn.net/qq_34937637/article/details/80702865)


## share memory vs copy memory

|  share data           |  copy data        |
|-----------------------|-------------------|
|  torch.as_tensor      |  torch.tensor()   |
|-----------------------|-------------------|
|  torch.from_numpy()   |  torch.Tensor()   |


link: [https://deeplizard.com/learn/video/AglLTlms7HU](https://deeplizard.com/learn/video/AglLTlms7HU)

> 1. Since `numpy.ndarray` objects are allocated on the CPU, the `as_tensor()` function must copy the data from the CPU to the GPU when a GPU is being used.
> 2. The memory sharing of `as_tensor()` doesn't work with built-in Python data structures like lists.
> 3. The `as_tensor()` call requires developer knowledge of the sharing feature. This is necessary so we don't inadvertently make an unwanted change in the underlying data without realizing the change impacts multiple objects.
> 4. The `as_tensor()` performance improvement will be greater if there are a lot of back and forth operations between `numpy.ndarray` objects and tensor objects. However, if there is just a single load operation, there shouldn't be much impact from a performance perspective.


NIST: national institute of standards and technology
ETL: extract, transform, load


# Backpropagation

good post link: [post-backpropagation](http://colah.github.io/posts/2015-08-Backprop/)

another very good video: [video-backpropagation](https://www.youtube.com/watch?v=tIeHLnjs5U8)

