---
---

# Python decorator in detail

good document: [python-decorator](https://realpython.com/primer-on-python-decorators/)



## Caution!

```python
"""
Be careful of the differences for the following two decorators

we will know, decorator will take parameters in a sequence;

1) decorator inputs
2) function name
3) arguments

Thus, to correctly use these two decorators;

@template_def_decorator
def function(args):
    pass

@template_set_decorator(VALUES)
def function(args):
    pass

Caution: VALUES cannot be omitted, otherwise,
    -> `function' will be set to `des'
    -> `args' will be set to `fn'
    so, errors will happen
"""

def template_def_decorator(fn):
    def wrapper(*args,**kwargs):
        return fn(*args,**kwargs)
    return wrapper

def template_set_decorator(des):
    def wrapper(fn):
        return fn
    return wrapper
```

```python
# example
@template_set_decorator('good')
def add(a,b):
    return a+b

print(add(1,3))     # 4, without any problems


@template_set_decorator
def add(a,b):
    return a+b

print(add(2,4))
# Traceback (most recent call last):
#   File ~~~
#     print(add(2,4))
# TypeError: wrapper() takes 1 positional argument but 2 were given
#
# because fn is set to "2, 4"
```

