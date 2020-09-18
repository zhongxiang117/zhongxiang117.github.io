---
---

# Ruby class inheritance

ruby does not support **multi-inheritance**, however, this imperfection can be very well bypassed by using **mixin**.

then it comes to the discussion of `include` and `extend`


# include

works for `module`s, to fulfill **mixin**, like injecting or copying/pasting _code-chuck-reference_ to current place, in a way maximumly reducing the codes repeating.

however, if it is used inside `class`, it has to be initialized first by using `.new`


# extend

works like `include`, however, it does not need initialization.


# example

```ruby
module Base
    def hello
        puts "how are you"
    end
end

class Foo
    include Base    # Foo.new.hello
end

class Bar
    extend Base     # Bar.hello
end
```


```note
for more info, please read another post: [`ruby-include-vs-include`](include-vs-extend.html)
```

# More

A very good document [`class-inheritance`](https://launchschool.com/books/oo_ruby/read/inheritance)

```note
in case of any errors, here is a backup file: [`backup-class-inheritance`](file/class-inheritance-9_18_2020.html)

All rights belong to the author that link shows.

Also, in here I express my great gratitude to OP for such a helpful and useful document!
```


# module can be overwritten

multiple times methods defining for module will add different methods into it, if those adding methods have different methods' names.

```ruby
module Foo
  def good
    puts "good"
  end
end

module Foo
  def nice
    puts "nice"
  end
end


# Foo is rewritten multiple times
# However, Bar will have both good and nice methods
class Bar
  include Foo
end

test = Bar.new

test.good       #==> good
test.nice       #==> nice
```

However, if the methods have the same name, the _old_ methods in `method-resolution-order` will be overridden.



