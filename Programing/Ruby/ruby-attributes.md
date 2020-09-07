---
---

# Ruby Attributes

By design, in `Ruby`, only methods can access `instance variable`.

```note
For more talking about `variable`s, please read [`ruby-variables`](class-variable-and-instance-variable.html)
```

it will cause error:

```ruby
class Audio
    def initialize(song)
        @song = song
    end
end

my_music = Audio.new("Hello")
my_music.song       #==> NoMethodError, undefined method `song'
```

to access `@song`, another method has to be defined.


```ruby
# codes 1
class Audio
    def initialize(song)
        @song = song
    end
    def song
        @song
    end
end

# usage
my_music = Audio.new("Hello")
puts my_music.song
```

**Why is it?**

I would like to say it is `ruby`'s characteristics.

Or, define method in another way:

```ruby
# codes 2
class Audio
    def song=(song)
        @song = song
    end
end

# usage
my_music = Audio.new
my_music.song = "Hello"
```


```note
if you pay attention to the difference between `codes 1` and `codes 2`, you will find there are two different type of methods to access `instance variable`s

* method access, `song`
* method assignment, `song=`
```


# Simple Solution

it will be very tedious and cumbersome if there are so many `instance variable`s needing to be accessed, for the sake of debugging or inspecting, then it comes to `ruby-attribute`.

* `attr_accessor`, has both `:var, :var=`
* `attr_reader`, has only `:var`
* `attr_writer`, has only `:var=`


for example

```ruby
class Audio
    attr_accessor :song
    def initialize(song)
        @song = song
    end
end

# usage
my_music = Audio.new("Hello")
puts my_music.song
```

```note
Things need to know

* any undefined `instance variable` will return `nil`
* `initialize` method is not a must, but it can help set initial value
```

# Way to peek at attribute


* `p class === puts class.inspect`    # instance variable
* `class.methods.sort`                # class methods
* `puts class.to_yaml`  #<== `require 'yaml'`