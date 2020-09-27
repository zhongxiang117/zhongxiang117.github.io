---
---

# CSS Precedence

A very good document [`CSS-Precedence`](https://vecta.io/blog/definitive-guide-to-css-styling-order)

```note
in case of any errors, here is a backup file: [`backup-CSS-Precedence`](file/CSS-precedence-2020-09-21.html)

All rights belong to the author that link shows.

Also, in here I express my great gratitude to OP for such a helpful and useful document!
```


# more

using specificity rule;

1. inline style             = 1000
2. ID selector              = 100
3. class & pseudo-class     = 10
4. elements                 = 1

> Start at 0, add 1000 for style attribute, add 100 for each ID, add 10 for each attribute, class or pseudo-class, add 1 for each element name or pseudo-element.


**for example**

```css
A: h1
B: #content h1
C: <h1 style="color: #ffffff">Heading</h1>
```

```
result

A: 0001     element
B: 0101     ID & element
C: 1000     inline
```

**supplementary**

1. same specificity, latter win
2. embedded win external import

```css
div#a {background-color: green;}        // class+ID = 110
#a {background-color: yellow;}          // ID       = 100
div[id=a] {background-color: blue;}     // attr.    = 10
```




