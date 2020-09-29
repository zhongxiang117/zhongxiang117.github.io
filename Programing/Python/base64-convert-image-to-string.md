---
---

# Convert Image To String and Vice Versus

sometime we need to convert `image` to `string` to fully save the data into one file, then it comes `base64` module.

Base64 enables to convert bytes which in the format **binary** or **text** data to `ASCII` characters.

it is in `base` of **64** characters;

* 26 uppercase letters
* 26 lowercase letters
* 10 numbers
* '+' and '/' for new lines

thus each character in `base64` represents **6** (_2^6=64_) bits of info in `binary`.

## command line

official line: https://docs.python.org/3.8/library/base64.html

```python
import base64

base64.b64encode(s, altchars=None)
```

to write it to a `text` file

```python
import base64

with open('image.jpg', 'rb') as f:
    data = f.read()
# encode to base64
data_encode = base64.b64encode(data)

# write binary
with open('file.txt','wb') as f:
    f.write(data_encode)
```


