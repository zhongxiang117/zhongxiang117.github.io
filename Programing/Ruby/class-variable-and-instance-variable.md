---
---

# Class & Instance & Global Variable

**In a nutshell,**

* `$<varaible>`: global variable, which can be accessed by anywhere in the program
* `@@<variable>`: class variable, which can be accessed by all instances of that class
* `@<variable>`: instance variable, which are only accessed by the object currently having it


# example

```ruby
#!/usr/bin/env ruby

$song = "Hello"

class Audio
  def initialize
    @@song = nil
    @song = nil
  end

  def set_class_variable=(song)
    @@song = song
  end

  def set_instance_variable=(song)
    @song = song
  end

  def print_song
    puts "$song == #{$song}"
    puts "@song == #{@song}"
    puts "@@song == #{@@song}"
  end
end

song1 = Audio.new
song2 = Audio.new
song3 = Audio.new

puts "song1"                    #           song1       song2       song3
puts song1.print_song           #  $song =  Hello       Hello       Hello
puts "song2"                    #  @song =  nil         nil         nil
puts song2.print_song           # @@song =  nil         nil         nil
puts "song3"
puts song3.print_song
puts ''

# instance variable only belongs to current instance
song1.set_instance_variable = "Skin"

puts "song1"                    #           song1       song2       song3
puts song1.print_song           #  $song =  Hello       Hello       Hello
puts "song2"                    #  @song =  Skin        nil         nil
puts song2.print_song           # @@song =  nil         nil         nil
puts "song3"
puts song3.print_song
puts ''

# class variable only is shared with all its instances
song3.set_class_variable = 'Soldier'

puts "song1"                    #           song1       song2       song3
puts song1.print_song           #  $song =  Hello       Hello       Hello
puts "song2"                    #  @song =  Skin        nil         nil
puts song2.print_song           # @@song =  Soldier     Soldier     Soldier
puts "song3"
puts song3.print_song
puts ''
```
