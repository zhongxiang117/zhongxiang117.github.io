---
---

# Format String Literals

link: [formatted-string-literals](https://docs.python.org/3.6/reference/lexical_analysis.html#formatted-string-literals)


Basic Usage

```python
name = 'UM'

print(f'how are you? {name}')

# convention {literal!r}
# convention ::= "s" | "r" | "a"
# s=str; r=repr; a=ascii

# format    {literal:format_spec}
```