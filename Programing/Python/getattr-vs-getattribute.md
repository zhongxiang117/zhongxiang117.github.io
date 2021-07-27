---
---

# Python __getattr__ vs __getattribute__

link: [https://stackoverflow.com/questions/4295678/understanding-the-difference-between-getattr-and-getattribute](https://stackoverflow.com/questions/4295678/understanding-the-difference-between-getattr-and-getattribute)

another good link: [https://blog.rmotr.com/python-magic-methods-and-getattr-75cf896b3f88](https://blog.rmotr.com/python-magic-methods-and-getattr-75cf896b3f88)

in a nutshell, `__getattr__` will call attributes which it doesn't explicitly manage, `AttributeError` will be raised if not found.

while `__getattribute__` will be called whenever an attribute access occurs, which may potentially result infinite loops. Thus, its "parent" in `MRO` should be returned, if implemented.


