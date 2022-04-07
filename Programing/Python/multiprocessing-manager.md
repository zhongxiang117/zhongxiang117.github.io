---
---

# Multiprocessing.Manager to share data via of server

`multiprocessing` is a powerful python module to run parallel processing, effectively side-stepping the `GIL`. Mainly, there are two methods to share data among processes, one is using `Shared Memory`, the other one is by using `Manager Server`, the former is faster with the `cbytes`, but the latter is more flexible, which is the one that I mostly would like to choose.

There are some cautions to use `Manager Server`: it does not support dynamic allocations, the data shared by it has to be `id` fixed **all the time**, let me show you some examples.

```python
from multiprocessing import Manager, Process

def e():
    return list(range(10))

def f(l):
    print('inside-start')
    t = e()
    print('inside->',t)
    l.extend(t)                 # id of Manager, good
    l.append([1,2])             # id of Manager, good
    print(1,id(l))              # id of Manager, good
    l = [[[1,2],[3,4]]]         # id changed, not allowed
    print(2,id(l))              # id of the local l

if __name__ == '__main__':
    t = None
    with Manager() as manager:
        l = manager.list()
        print('here->1')
        p = Process(target=f, args=(l,))
        print(3,id(l))          # id of Manager
        print('here->2')
        p.start()
        print('here->3')
        print(4,id(l))
        p.join()
        print(5,id(l))
        print('here->4')
        print(l)
        print(6,id(l))
        t = list(l)
    print('outer')
    print(t)
```

```
# Outputs

here->1
3 139945258348208
here->2
here->3
4 139945258348208
inside-start
inside-> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
1 139945258348208
2 139945250452480                       <<- local l
5 139945258348208
here->4
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, [1, 2]]
6 139945258348208
outer
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, [1, 2]]
```

By understanding above example, it should be enough for using of `Manager`, cause the same rule is also applied to its other objects.


