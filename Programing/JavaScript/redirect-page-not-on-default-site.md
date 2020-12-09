---
---

# redirect local saved page to custom or default host


an example shown on `csdn` page;

```html
<div style="display:none;">
    <img src="" onerror="setTimeout(function(){if(!/(csdn.net|iteye.com|baiducontent.com|googleusercontent.com|360webcache.com|sogoucdn.com|bingj.com|baidu.com)$/.test(window.location.hostname)){window.location.href=&quot;\x68\x74\x74\x70\x73\x3a\x2f\x2f\x77\x77\x77\x2e\x63\x73\x64\x6e\x2e\x6e\x65\x74&quot;}},3000);">
</div>
```

Online PHP and Javascript Decoder: [https://malwaredecoder.com/](https://malwaredecoder.com/)


```note
\x68\x74\x74\x70\x73\x3a\x2f\x2f\x77\x77\x77\x2e\x63\x73\x64\x6e\x2e\x6e\x65\x74 == https://www.csdn.net
```


