---
---

# Ruby Colon -- : & ::

here is an explanation of the colon meaning in `ruby` language.

```ruby
:       #==> Ruby Symbol
::      #==> Ruby Namespace Resolution Operator
```


# single colon -- Ruby Symbol

a very well document, please read: [`ruby-symbol`](http://www.troubleshooters.com/codecorn/ruby/symbols.htm)

## definition

`ruby-symbol` starts with a colon `:`, it either can be a _string_ or a _sentence_ with white spaces (must be quoted)

```ruby
:my_symbol

OR

:"my symbol string"
```

## symbol is immutable

`ruby-symbol` holds the value of its **defining**, it cannot be changed or redefined.

for example;

```ruby
:my_symbol                  # has the value of "my_symbol"

:my_symbol = "your_symbol"  # wrong, symbol is immutable
```

## method

it has two main parts, `string-representation` (its definition) & `integer-representation` (its reference)

```ruby
puts :my_symbol         #==> my_symbol, --- most time it refers string representation

puts :my_symbol.to_s    #==> my_symbol, --- string representation

puts :my_symbol.to_i    #==> a reference integer number, --- integer representation
                        #==> deprecated since version 1.9, use `.object_id` instead

puts :my_symbol.class   #==> Symbol
```

```note
`ruby-symbol` is not the `String`, even with **string-representation** it can use all `String` methods.

rather, it is a **thing** _(like container)_ that has both **string-representation** and **integer-representation**
```

for example:

```ruby
"foo".equal? "foo"      #==> false
"foo" == "foo"          #==> true
:foo.equal? :foo        #==> true
:foo == :foo            #==> true
```

## usage

* a constant, don't need to change its value at runtime

this will be extremely helpful when the same **constant** is accessed in innumerous times, if used with `symbol`, it will have a great boost of performance.



# double colon -- Ruby Namespace Resolution Operator

`namespace` plays an very important role in many computer languages.

for more, please read: [`wikipedia-namespace`](https://en.wikipedia.org/wiki/Scope_resolution_operator)


it helps to access constant, module or class defined inside other classes or modules.

its definition:

```
The :: is a unary operator that allows: constants, instance methods and class methods defined within a class or module, to be accessed from anywhere outside the class or module.
```


```note
for `ruby-namespace-scope`, all their beginning top level is `Object`

which means if a namespace is defined like `::namespace`, then it is in a `global-scope`, same like `Object::namespace`
```



