---
---

# modules

### numpy.testing


`assert_almost_equal` and more...



### pytest

`pytest.fixture` can be **requested** many times, however they can only be executed once per test, and their return values are extracted from `cached`.

link: [pytest.fixture](https://docs.pytest.org/en/stable/fixture.html)

```python
# contents of test_append.py
import pytest

# Arrange
@pytest.fixture
def first_entry():
    return "a"

# Arrange
@pytest.fixture
def order():
    return []

# Act
@pytest.fixture
def append_first(order, first_entry):
    return order.append(first_entry)

def test_string_only(append_first, order, first_entry):
    # Assert
    assert order == [first_entry]

# the reason this test not fails is `append_first` can only be
# executed once, or fixture is not executed every time when it
# is requested, so for `order` in `append_first` and 
# `test_string_only` is actually on the same reference.



def test_string(order):
    # Act
    order.append("b")
    # Assert
    assert order == ["b",]

def test_int(order):
    # Act
    order.append(2)
    # Assert
    assert order == [2,]

# the reason the test not fails at here is that
# order is cached as the empty list `[]`
# together can be used to illustrate fixture is reusable


# Caution: be careful with fixture(autouse=True)
# if you set it onto `append_first`, which will cause errors
# for `test_string` & `test_int`, cause at that time
# parameter order will always be `['a', ]`
```


**scope**

[backup]

good document: [pytest-scope](https://betterprogramming.pub/understand-5-scopes-of-pytest-fixtures-1b607b5c19ed)

excerpt:

> basic execution order: session > package > module > class > function.
>
> * Fixtures of higher-scopes are executed first.
> * Fixtures with `autouse=True` are executed before other fixtures within the same scope.





