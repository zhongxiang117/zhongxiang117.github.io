---
---

# A Different Way to Solve Quadratic Equations

Idea is took from [**Prof. Po-Shen Loh**](https://www.poshenloh.com/quadratic/)

This method is pretty fascinating and inspiring.


suppose we have an quadratic equation:

```
X^2 + a*X + b = 0

a, b is known & constant
```

if we want to solve this equation to get its root, how do we do that?

definitely it has the _classical_ way [Quadratic Formula](https://en.wikipedia.org/wiki/Quadratic_formula)

however it is not the way we really want.

the following is idea,

```
we rewrite equation by the multiplication of two unknowns

(X + [1]) * (X + [2]) = 0

by comparison;

[1] + [2] = a
[1] * [2] = b

by using a/2, we surely can have,

(a/2 - u) + (a/2 - u) = a

then the problem becomes, finding u to make;

(a/2 - u) * (a/2 + u) = b

upto here, it becomes extremely simple to get,

1/4 * a^2 - u^2 = b

once u is got, we can back calculate,

[1] = a/2 - u
[2] = a/2 + u

inverse these two roots are the answer that we want to get
```

## python codes

```python
def solve_quadratic_equation(a,b):
    """Solve Quadratic Equation
    Parameter (Number):
        a, b is the parameter in quadratic equation
        X^2 + a*X + b = 0
    Return (Tuple):
        If equation has real roots (1D): (x1, x2)
        otherwise (2D):  ((t1,-t2), (t1,t2))
    """
    t = a*a/4 - b
    if t >= 0:
        u = pow(t,1/2)
        x1 = 0 - (a/2 - u)
        x2 = 0 - (a/2 + u)
    else:
        u = pow(-t,1/2)
        x1 = (-a/2, u)
        x2 = (-a/2, -u)
    return (x1, x2)
```


