---
---

# Bytes on Numpy Array


this post was inspired by my work, `hash` on the list to calculate molecular Fingerprint, anyway, I happen to read other's source codes that the operation of `hash` function can be directly applied on the `numpy.array`. After a while digging, then I know, for `Numpy object`, there are implemented methods;

```python
import numpy as np

import io
import sys
import pickle

# `.tobytes` is a concatenation of every object's bytes
s = [1,2,3]
sobj = np.array(s, dtype=object)

#sobj.tobytes()
#b'\x01\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00'

#                                   8 bytes, little Endian
sobj.tobytes() == b''.join([i.to_bytes(8,'little') for i in [1,2,3]])
# True

# `bytesorder` of Numpy follows with `sys.bytesorder`
# refer to `np.dtype.byteorder` for more info
sobj.dtype.byteorder    # output: '='
sys.byteorder           # output: 'little'


# for pickle usage

#    int, float, str,    tuple,  dict
l = [1,   2.0,   'good', ('s',), {4: 'k'}]

obj = np.array(l, dtype=object)

obj.tobytes()
# b'\xe0\xdd/~\xc9U\x00\x00p\x95\x85\xad\xd3\x14\x00\x00\xf0x\xa2\xf4\xd3\x14\x00\x00\x10cQ\xad\xd3\x14\x00\x00\xc0\\;\xad\xd3\x14\x00\x00'

bio = io.BytesIO()
pickle.dump(l,bio)
bio.seek(0)     # important: initialize

obj == np.load(bio,allow_pickle=True)
# array([ True,  True,  True,  True,  True])
#
# also, you will mostly see the warning, but it's fine
#
#   VisibleDeprecationWarning: Creating an ndarray from ragged nested sequences
#   (which is a list-or-tuple of lists-or-tuples-or ndarrays with different lengths or
#   shapes) is deprecated. If you meant to do this, you must specify 'dtype=object'
#   when creating the ndarray.
```





