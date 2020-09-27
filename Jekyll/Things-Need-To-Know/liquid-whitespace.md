---
---

# Liquid Whitespace Control

office-like: [`liquid-whitespace-contrl`](https://shopify.github.io/liquid/basics/whitespace/)

{% raw %}

it has a line:

> If you don’t want any of your tags to print whitespace, as a general rule you can add hyphens to both sides of all your tags (`{%-` and `-%}`):

however, it is not that much informative and clear, even with the help of their examples.

As a complementary, there are more examples:



# In Assignment

There are three examples.

## keep original

**input**

```bash
            # before: empty-line-1
            # before: empty-line-2
            # before: empty-line-3
{% assign song = "Hello" %}     # assignment line
            # after: empty-line-1
            # after: empty-line-2
{{ song }}
```

**output**

```bash
            # before: empty-line-1
            # before: empty-line-2
            # before: empty-line-3
            # assignment line
            # after: empty-line-1
            # after: empty-line-2
Hello       # `song' is printed out in its original line
```


## left-side strip

**input**

```bash
            # before: empty-line-1
            # before: empty-line-2
            # before: empty-line-3
{%- assign song = "Hello" %}     # assignment line
            # after: empty-line-1
            # after: empty-line-2
{{ song }}
```

**output**

```bash
            # assignment line
            # after: empty-line-1
            # after: empty-line-2
Hello       # printout without former whitespace
```


## right-side strip

**input**

```bash
            # before: empty-line-1
            # before: empty-line-2
            # before: empty-line-3
{% assign song = "Hello" -%}     # assignment line
            # after: empty-line-1
            # after: empty-line-2
{{ song }}
```

**output**

```bash
            # before: empty-line-1
            # before: empty-line-2
            # before: empty-line-3
Hello       # printout without latter whitespace or assignment line
```

```note
Attention: The `assignment-line` is also removed
```


## both-sides strip

**input**

```bash
            # before: empty-line-1
            # before: empty-line-2
            # before: empty-line-3
{%- assign song = "Hello" -%}     # assignment line
            # after: empty-line-1
            # after: empty-line-2
{{ song }}
```

**output**

```bash
Hello       # printout without any whitespace
```


# in loop-control

its official link: [`liquid-loop-control`](https://shopify.github.io/liquid/tags/control-flow/)

```note
In total, it has three different types of loop control, in here, only the `if-elsif-else` control is talked. The mechanism for whitespace removing of the other two `case-when` & `unless-if` are similar with `if` control.
```


![`liquid-if-elsif-else-whitespace-control`](file/liquid-whitespace-control.png)




# important note

number of spaces in printout line dose not matter, for example:


**input**

```bash
{%- assign song = "Hello" -%}
{{ song }}

<!-- OR -->
{{ song                       }}

<!-- OR -->
{{               song }}

<!-- OR -->
{{song}}
```


**output**

all their results will be

```
Hello
```

{% endraw %}