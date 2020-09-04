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


