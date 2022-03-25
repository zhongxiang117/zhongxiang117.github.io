---
---

# Python @classmethod and @staticmethod

if you know `C/C++`, similarly, for `Python`, `@classmethod` works as the `overloading`, while `@staticmethod` works as `encapsulation`.

let me use some codes:

```python
class Day:
    def __init__(self,day):
        self.day = day

    @classmethod
    def NewDay(cls,sday):
        return cls(int(sday))

    @staticmethod
    def getday(day):
        return day

    def getday(self):           # where hasattr works
        return self.day


mday = Day(20)
nday = Day.NewDay('30')
print(hasattr(mday,'getday'))   # True
print(hasattr(nday,'getday'))   # True
print(mday.day)                 # 20
print(nday.day)                 # 30
print(Day.getday(20))           # 20
```

the wrapped `getday` by `@staticmethod` is just the regular function that we want it to be inside `class Day` to fulfill integration and encapsulation.

another `getday` wrapped by `@classmethod` works as overloading, now it can work both on `str` and `int`.



