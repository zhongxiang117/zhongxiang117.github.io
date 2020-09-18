---
---

# Ruby dot Syntax

Ruby has data type `Hash`, however, it is only accessed in its **initial** defined way, which means, if you define the key in `ruby-symbol`, it is `symbol` accessed, else if it is `ruby-string`, then it is `string` accessed.

For example

```ruby
t = {}

t[:good] = "good"
t["nice"] = "nice"

puts t      #==> {:good=>"good", "nice"=>"nice"}

t[:good]    #==> "good"
t["nice"]   #==> "nice"

# error may occur
t["good"]   #==> nil
t[:nice]    #==> nil
```

However, anythings in the beginning initialization will be set as `ruby-symbol`

```ruby
t = {good:"good", "nice":"nice"}

puts t      #==> {:good=>"good", :nice=>"nice"}
```


```note
For more about `ruby-symbol`, please read: [`ruby-single-and-double-colon`](single-and-double-colon.html)
```


no matter in which way, Ruby `Hash` does **NOT** have `dot-syntax` for it's keys.

```ruby
t.good      #==> NoMethodError (undefined method `good' ...)
```


# How to make it dottable?


## require 'ostruct'

```ruby
require 'ostruct'
t = {good:"good", "nice":"nice"}

t_dot = OpenStruct.new(t)

t_dot.good  #==> "good"
```

_NOTE: It does not work with nested hashes._


## require 'hash_dot'

```ruby
require 'hash_dot'
t = {good: { well: "good" }, "nice":"nice"}

t_dot = t.to_dot

t_dot.good.well  #==> "good"
```

NOTE: `hash_dot` has to be pre-installed, `sudo gem install hash_dot`

github link: [`ruby-HashDot`](https://github.com/adsteel/hash_dot)


## no modules required, use splat operator

```ruby
t = {good:"good", "nice":"nice"}

t_dot = Struct.new(*t.keys).new(*t.values)

t_dot.good  #==> "good"
```

_NOTE: It does not work with nested hashes._


