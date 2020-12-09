---
---


# YAML


> YAML (a recursive acronym for "YAML Ain't Markup Language") is a human-readable data-serialization language.

its official website: [`YAML`](https://yaml.org/)

a very well `yaml` format document: [`yaml-format`](https://symfony.com/doc/current/components/yaml/yaml_format.html)

## Need to know

1. how to define `variable`s
2. understand how `variable`s are parsed

### Explanation 1 -- defining

Different level of `variables` is defined by level of indentations. Although `yaml` does not restrict in which type of indicators to use, my suggestion is please use `space` as the indicator.

for example:

```yaml
level_1:
    greeting:
      hello         # warning: "hello" & "hi" will not be collected into Array as expected
      hi            # instead, it will be a single string "hello hi"
    level_2:
        name:
          yaml      # same problem
          jekyll
        level_3: true
```

when `jekyll` parsed, a metadata `site.level_1` will be constructed.


```warning
Defining `yaml` in top way is not suggested, because it is not well-leveled.
```

pay attention to `greeting` and `level_2`, alternatively, the suggestion is:


```yaml
# please check the difference with the top defining

level_1:
    - greeting:       # suggested
      - hello
      - hi
    - level_2:
        - name:
          - yaml
          - jekyll
        - level_3: true
```

in order to avoid confusing & wrong interpreting, hyphen **`-`** is suggested to use when defining metadata.


if and only if you have top-level one-line parameter, you can omit `-`:

```yaml
# File _config.yml

# top-level oneline parameter

greeting: Hello

# another one
name: yaml
```


**For Long String Spans Multi-lines**

```yaml
long_string: >
  This is a very 
  long sentence
  in the YAML.

long_string: >-
  This is a very
  long sentence
  in the YAML.

# new line will be removed
# The parsed result: "This is a very long sentence in the YAML.\n"
```


### Explanation 2 -- parsing

{% raw %}


**Example-1**

```yaml
level_1: 
    greeting:
      hello
      hi
    level_2:
        name:
          yaml
          jekyll
        level_3: true
```

```yaml
{{ site.level_1 }}

#=> Object
#
#   { "greeting"    =>  "hello hi",
#     "level_2"     =>  {   "name"=>"yaml jekyll",
#                           "level_3"=>true
#                       },
#   }


{{ site.greeting }} #=>  "hello hi"
```



**Example-2**

```yaml
level_1:
    - greeting:
      - hello
      - hi
    - level_2:
        - name:
          - yaml
          - jekyll
        - level_3: true
```

```yaml
{{ site.level_1 }}

#=> Array & Object
#
#   [{ "greeting"    =>  ["hello", "hi"] },
#
#    { "level_2"     =>  [
#                           { "name"=>["yaml", "jekyll"] },
#                           { "level_3"=>true },
#                        ]
#    },
#
#   ]


{{ site.level_1[0].greeting }}      #=>  ["hello", "hi"]

{{ site.level_1[0].greeting[0] }}   #=>  "hello"
{{ site.level_1[0].greeting[1] }}   #=>  "hi"

{{ site.level_1[1].level_2[0].name }}   #=>  ["yaml", "jekyll"]

{{ site.level_1[1].level_2[0].name[0] }}   #=>  "yaml"
```



```note
Be extremely careful about the difference in `Array` and `Object` when whether using hyphen `-` or not
```


**Example-3 Mixing**

```yaml
level_1:
    - greeting:
      - hello
      - hi
      say: welcome
    - level_2:
        - name:
          - yaml
          - jekyll
          build: gem
        - level_3: true
```

```yaml

{{ site.level_1 }}

#=> Array & Object
#
#   [{ 
#      "greeting"    =>  ["hello", "hi"], 
#      "say"         => "welcome",
#    },
#
#    { "level_2"     =>  [
#                           { 
#                             "name"=>["yaml", "jekyll"],
#                             "build"=>"gem",
#                           },
#
#                           { "level_3"=>true },
#                        ]
#    },
#
#   ]


{{ site.level_1[0].greeting[0] }}  #=> "hello"

{{ site.level_1[0].say }}   #=> "welcome"

{{ site.level_1[1].level_2[0].name[0] }}  #=> "yaml"

{{ site.level_1[1].level_2[0].build}}  #=> "gem"
```
{% endraw %}


```note
If you want to make sure you are good, my suggestion is using `ruby` check your setting.
```

```ruby
require 'yaml'

file = YAML.load_file("YOUR_YAML_FILE.yml")

puts file
```
