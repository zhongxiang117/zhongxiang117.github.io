---
---

# Check String Whether Include Substring

sometimes we need to check a string is whether include a substring, here is the solution.


```bash
string='This is the index string'

substring='string'


# method 1
if [[ -n "$(echo $string | grep "$substring")" ]]
then
    echo "included"
else
    echo "not include"
fi

# method 2, here-string
if [[ -n "$(grep "$substring" <<< "$string")" ]]
then
    echo "included"
else
    echo "not include"
fi
```

By simply testing, we can easily know that those using `sub-shell` method will consume way too much time, especially when there are so many strings awaiting to process. The suggestion is to use `wildcards`.


```bash
string='This is the index string'

substring='string'

# wildcards

if [[ "$string" == *"$substring"* ]]
then
    echo "included"
else
    echo "not include"
fi
```

```note
1. in here, for the string comparison, there is no difference between regular expression operator `=~` and logical operator `==`.

2. it is recommended to use double quotes to prevent shell pre-interpreter to avoid any unexpected results when the empty string is input.
```

