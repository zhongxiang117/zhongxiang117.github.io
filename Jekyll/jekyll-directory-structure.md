---
---


# Jekyll Directory Structure & Variables


please read official document [`directory-structure`](https://jekyllrb.com/docs/structure/)


# Directory Structure

To facilitate explaining, with slightly modification, I copied structure in here;

```
├── _config.yml
├── _data
│   └── data.yml
├── _drafts
│   └── draft.md
├── _includes
│   ├── footer.html
│   └── header.html
├── _layouts
│   ├── default.html
│   └── post.html
├── _posts
│   └── 2020-09-10-how-are-you.md
├── _sass
│   ├── _base.scss
│   └── _layout.scss
├── _site
├── .jekyll-metadata
└── index.html
```


# Variables

anything defined in `_config.yml` will become `site.VARIABLE`

for example:

```
# FILE: _config.yml

author: Xiang Zhong
```

when building, metadata `site.author` will be made.


```note
this file is parsed by `ruby-yaml` package.

for more, please refer: [`things-need-to-know-yaml`](Things-Need-To-Know/yaml.html)
```








