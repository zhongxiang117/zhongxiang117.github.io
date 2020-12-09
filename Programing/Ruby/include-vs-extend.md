---
---

# Ruby include vs extend

`include` makes module methods as **instance methods** in the target class

`extend`: makes module methods as **class methods** in the target class


A very good document [`ruby-include-vs-extend`](https://medium.com/@leo_hetsch/ruby-modules-include-vs-prepend-vs-extend-f09837a5b073)


[backup]


```ruby
module Foo
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def bar
      puts 'base extend -- class method'
    end
  end
  
  def foo
    puts 'include -- instance method'
  end
end

class Bar
  include Foo
end

Bar.bar         #==>  class method
Bar.new.foo     #==>  instance method
Bar.foo         #==>  NoMethodError
Bar.new.bar     #==>  NoMethodError
```






