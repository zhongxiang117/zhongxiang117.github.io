---
---


# Ruby Literals

literals create object that can be used in program.


* String
* Number
* Symbol
* Boolean & nil
* Array
* Range
* Hash
* RegExp
* Procs



## Number

```note
you can use underscore `_` to enhance human readability
```
for example

```ruby
t = 1_2_3_4
s = 1234

s == t      #==> true
```


## Boolean & nil

except `false` and `nil` are `false`, all others are evaluated to `true`

### Boolean Method

a function defined ends with `?`

```ruby
def ok?
    # codes chunk
end
```

then, they will always return either `true` or `false`


```note
for more, please read [`Ruby-Boolean`](https://www.rubytapas.com/2019/01/08/boolean/)
```

## Range

```ruby
(1..100)    # includes end value, 100
(1...100)   # excludes end value, 100
```

## Hash

**using key-value method**
```ruby
{"a" => 1, "b" => 2}
```

**using symbol keys**

```ruby
{a:1, b:2}

OR

{"a":1, "b":2}
```


## Regular Expression

anything included between `/` 


## Percent Inputs

`%()` creates String, besides any other type of characters are supported
like, `%[]`, `%{}`, `%!!`, `%//`


* `%Q` double quoted `String`, similar like top, supports expression substitution or escapes.

* `%q` single quoted `String`

* `%W` double quoted `String`s in `Array`

* `%w` single quoted `String`s in `Array`

* `%x` like `\``, command line interpreter, **note**: the newline char will be appended

```ruby
%x(echo "good")     #==> "good\n"   ==> '\n' will be preserved
```

* `%r` regular expression

* `%s` **single symbol**, for example, `%s(how are you)` will output `:"how are you"`

* `%I` double quoted `symbol`s in `Array`

* `%i` single quoted `symbol`s in `Array`


## Here Document

```note
please refer to [`ruby-heredoc`](https://github.com/rubocop-hq/ruby-style-guide#percent-w)
```


