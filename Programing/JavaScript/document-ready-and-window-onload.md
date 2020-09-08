---
---

# document.ready vs window.onload

```note
for web page parsing sequence, please read this question in `stackoverflow`, all of their answers

link: [`web-page-parser-sequence`](https://stackoverflow.com/questions/1795438/load-and-execution-sequence-of-a-web-page)
```

roughly speaking, in a sequence

1. parse html
2. load (external) js and data file
3. parse js
4. construct html DOM ==> `ready()`
5. images and other components
6. all is done ==> `onload()`


# document.ready

```js
$(document).ready(function() { alert('test!'); });
```

is equivalent to

```js
$(function() { alert('test!'); });
```

it executes when `DOM` (Document Object Model) is ready.


