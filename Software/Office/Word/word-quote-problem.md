---
---

# Word quote problem


while I just fixed a "fancy" punctuation problem, which is related with "quote" sign.

Most time when I'm writing, I need to constantly switch between "chinese" and "English", however, it always come with a problem on the quote punctuation.

as a background to let you know, chinese is using the different Unicode on "quote" sign, here are their differences by illustrating with left double quote:


```
        Unicode character               Oct         Dec     Hex         HTML
“       left double quotation mark      020034      8220    0x201C      &ldquo;

        Unicode character               Oct         Dec     Hex         HTML
＂      fullwidth quotation mark        0177402     65282   0xFF02      &#65282;

        Unicode character               Oct         Dec     Hex         HTML
"       quotation mark                  042         34      0x22        &quot;
```

so, I would like to get some thing like:

```
this is the "English", and I switched the input source by inserting some “中文”,
what I want is, the quote sign only follows with my current input,
it should not have any corrections on my quote sign,
whether they are "closed  ” or not.
```
However, due to I didn't know behind-scene "smart-quote" correction, it has caused so much trouble to me.

FUCK! fuck this so-considerable setting, I had never known this.

To turn it off,

```
Option
    => Proofing 
        => AutoCorrection Options
            => AutoFormat As You Type
                => uncheck "straight quotes" with "smart quotes"
```

