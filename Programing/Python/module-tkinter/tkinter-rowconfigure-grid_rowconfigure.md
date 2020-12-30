---
---


# Python tkinter -- Difference between widge.rowconfigure vs widget.grid_rowconfigure

Actually, if you examine the source codes, you will find method `.rowconfigure` is just an alias for `.grid_rowconfigure`.

**Source link**: [rowconfigure](https://github.com/python/cpython/blob/3.9/Lib/tkinter/__init__.py#L1816)


Similarly, for tkinter, the command `.columnconfigure` is an alias for `.grid_columnconfigure`.

**Source link**: [columnconfigure](https://github.com/python/cpython/blob/3.9/Lib/tkinter/__init__.py#L1785)


Such a big surprise!!
