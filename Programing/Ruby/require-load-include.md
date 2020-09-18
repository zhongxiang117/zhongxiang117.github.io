---
---

# require vs load vs include


## include & extend

works for `module`s, to fulfill **mixin**, like injecting or copying/pasting _code-chuck-reference_ to current place, in a way maximumly reducing the codes repeating.

however, if it is used inside `class`, it has to be initialized first by using `.new`


for more, please read: [class-inheritance](class-inheritance.html)


> `include` the module makes all the module's methods **instance methods** whereas `extend` the module makes all its methods **class methods**, like prepending each one of them with `self`.

for more its talking, please refer: [`ruby-include-vs-extend`](include-vs-extend.html)


## require & require_relative

source outside file or library, extension `.rb` can be omitted, it **only** sources `once`, ignoring number of calls.

`require` is powerful of `require_relative`

```ruby
$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
```


## load

unlike `require`, `load` will load as its number of calls, besides, the **full filename** has to be input, it's meanly used to load _configuration_ files, `config.yml`, to show dynamic changes








