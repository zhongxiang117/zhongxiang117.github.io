---
---

# class vs instance attributes

for `class` object, any variable defined inside constructor `__init__` is the instance attributes, outside of it is called `class` attribute, for example,


```python
class MyClass
    class_attr = None
    def __init__(self,*args,**kwargs):
        instance_attr = None
```


please have a look on this question: [https://stackoverflow.com/questions/524714/does-python-have-class-prototypes-or-forward-declarations](https://stackoverflow.com/questions/524714/does-python-have-class-prototypes-or-forward-declarations)


To better understand their difference, [https://dzone.com/articles/python-class-attributes-vs-instance-attributes](https://dzone.com/articles/python-class-attributes-vs-instance-attributes)

Be extremely aware of behind the scene mechanism, `class attribute`s keep fixed only on immutable properties.

