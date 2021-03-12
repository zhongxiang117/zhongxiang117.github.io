---
---

# Tilde operation

good question: [https://stackoverflow.com/questions/8305199/the-tilde-operator-in-python](https://stackoverflow.com/questions/8305199/the-tilde-operator-in-python)

besides, an amazing website that I found: [Bit-Twiddling-Hacks](http://graphics.stanford.edu/~seander/bithacks.html)

In a nutshell, `~x == (-x)-1`, which might be useful in list index operation,

```python

array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
         ^     ^           ^     ^
# i      0     2          ~2    ~0
```