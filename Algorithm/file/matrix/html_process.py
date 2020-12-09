#!/usr/bin/env python3

# Scirpt to process <https://blog.csdn.net> page to a more decent format


# version 0.10: November 18, 2020
# version 0.20: add option for whether overwrite


import os
import sys
from bs4 import BeautifulSoup

def get_attributes(attrs):
    """return attributes string for input dict
    format: key="value" key="value"...
    spaces will be stripped
    """
    line = ''
    for i,j in attrs.items():
        s = ''
        # Caution! take care when value is list
        if isinstance(j,list):
            for k in j: s += k + ' '
            s = s.strip()
        else:
            s = j
        line += '%s="%s" ' % (i,s)
    return line.strip()


class Filter:
    def __init__(self,class_,tagname=None):
        if isinstance(class_,list):
            self.class_ = class_
        elif isinstance(class_,str):
            class_ = class_.replace(';',' ').replace(',',' ')
            self.class_ = class_.split()
        else:
            self.class_ = []
        self.tagname = 'div' if tagname is None else tagname
    def func(self,tag):
        # Caution in here
        if len(self.class_) == 0: return False
        if tag.name != self.tagname: return False
        if not tag.has_attr('class'):
            return False
        for i in self.class_:
            if i not in tag['class']:
                return False
        return True


if len(sys.argv) <= 1:
    print('Scripts to process files from <https://blog.csdn.net>')
    print('    Usage: [python3] {:s} file [True/False]'.format(sys.argv[0]))
    print('\nSet "True/False" to avoid overwrite original file, default is True')
    print('Inputs other than 1, T, True, Y, Yes will be thought as False')
    sys.exit()

if not os.path.isfile(sys.argv[1]):
    print('Error: Input is not a file')
    sys.exit()

bo = True
if len(sys.argv) > 2:
    if sys.argv[2].lower() not in ['1','t','true','y','yes']:
        bo = False

OUTFNAME = os.path.basename(sys.argv[1])
if not bo:
    ndx = OUTFNAME.rfind('.')
    if ndx == -1:
        name = OUTFNAME
        ext = ''
    else:
        name = OUTFNAME[:ndx]
        ext = OUTFNAME[ndx:] if ndx < len(OUTFNAME) else '.'
    cnt = 1
    while True:
        new = name + '-' + str(cnt) + ext
        if not os.path.isfile(new):
            break
        cnt += 1
    OUTFNAME = new


with open(sys.argv[1], 'rt') as f: html_doc = f.read()

soup = BeautifulSoup(html_doc,'html.parser')

url = soup.head.select_one('meta[name="savepage-url"]')
if url is not None and 'content' in url.attrs:
    url = url.attrs['content']
    url = url[:url.find('?')] if url.find('?') != -1 else url
else:
    url = 'https://blog.csdn.net'


contents = '<DOCTYPE! html>'

# get html attributes
line = get_attributes(soup.html.attrs)
contents += '<html ' + line + '>'


# get head attributes
line = get_attributes(soup.head.attrs)
contents += '<head ' + line + '>'

# title
contents += str(soup.title)

# all styles in head
for i in soup.head.find_all('style'): contents += str(i)

# head done
contents += '</head>'

# get body attributes
line = get_attributes(soup.body.attrs)
contents += '<body ' + line + '>'


# main article
article = ''
bodyfilter = Filter('main_father clearfix d-flex justify-content-center')
bodynode = soup.body.find(bodyfilter.func)



article = bodynode.select_one('#mainBox main .blog-content-box')

header = article.select_one('.article-header-box .article-header .article-info-box')
bartop = header.select_one('.article-bar-top .bar-content')
name = ''
time = ''
if bartop is not None:
    # edit top info
    name = bartop.select_one('.follow-nickName').string
    time = bartop.select_one('.time').string
header.clear()

INFO = """<div class="article-info-box"><div class="article-bar-top">
        <div class="bar-content">
            This article is posed by <b>AUTHOR</b>, at time: <em>TIME</em>
            <br/>In here, I express my gratitude for his/her contributions
            <br/>Reference: <a class="tag-link" href="URL" target="_blank">URL</a>
        </div></div></div>""".replace('URL',url)
if len(name) != 0: INFO = INFO.replace('AUTHOR',name)
if len(time) != 0: INFO = INFO.replace('TIME',time)
node = BeautifulSoup(INFO,'html.parser')
header.append(node)


# styles before article in body
beg = soup.body if bodynode is None else bodynode
for i in beg.find_previous_siblings():
    if i.name == 'style':
        contents += str(i)


contents += get_attributes(bodynode.attrs)
contents += '<div class="container clearfix" id="mainBox"><main>'
contents += str(article)
contents += '</main></div></div>'
# end
contents += '</body></html>'


with open(OUTFNAME,'wt') as f: f.write(contents)


