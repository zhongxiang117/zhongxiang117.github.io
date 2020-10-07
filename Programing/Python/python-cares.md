---
---

# Python Cares

a collection needs to pay attention on.


## Shallow Copy

```python
def change(n):
    n[0] = 'change'

t = [1,2,3]
change(t)

print(t)     #==>   ['change',2,3]

x = t
x[0] = 4

print(x)    #==> [4,2,3]
print(t)    #==> [4,2,3]

y = [9,]
y.append(x)

print(y)    #==> [9,[4,2,3]]

x[0] = 8

print(x)    #==> [8,2,3]
print(y)    #==> [9,[8,2,3]]


# same thing will happen on dictionary
# only immutable objects, like number, string, boolean
# will be copied as new values
# otherwise, the address is copied to
```


## Global Class Member

```python
class C:
    x = 0
    def init(self):
        C.x += 1

n = C()
n.init()
print(n.x)      #==> 1

m = C()
m.init()
print(m.x)      #==> 2
```


## Magic Method

```python
class Fibonacci:
    def __init__(self):
        self.a = 0
        self.b = 1
    def next(self):
        self.a, self.b = self.b, self.a+self.b
        return self.a
    def __iter__(self):
        return self

fb = Fibonacci()
for f in fb:
    if f > 1000:
    print(f)
    break

# In formal terms, `__iter__' method is iterable, 
# its iterator is `next'
```


## Recursion Method to Flatten Nested List

```python
def flatten(nestlist):
    try:
        # handle string
        if isinstance(nestlist,str): raise TypeError
        for sublist in nestlist:
            for element in flatten(sublist):
                yield element
    except TypeError:
        yield nestlist

list(flatten([1,[2,3],[4,[5,[6,[7,[8,9]]]]]]))  #==> [1,2,3,4,5,6,7,8,9]
```


