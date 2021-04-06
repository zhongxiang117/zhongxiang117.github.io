#!/usr/bin/env python3

import sys
from bs4 import BeautifulSoup


class HTMLCleaner:
    """Clean saved HTML file to make it more tidy and compact

    Args:
        html (str): input html file
        tagsdict (dict): {tag:words}: html tag, any its attrs contains string
            in words will be decomposed, words can be (str|list|True),
            if words is True, the tag will be removed. 
        fname (str): save file, if it is None, input html will be overwritten
    
    """
    def __init__(self,html,tagsdict,fname=None):
        self.html = html
        self.tagsdict = tagsdict
        self.fname = html if fname is None else fname

        with open(html,'rt') as f: contents = f.read()
        self.soup = BeautifulSoup(contents,'html.parser')


    def run(self):
        for tagname,v in self.tagsdict.items():
            mf = self.get_filter(v,tagname)
            tags = self.soup.find_all(mf)
            for i in tags: i.decompose()

        print('Note: html file is saved to {:}'.format(self.fname))
        with open(self.fname,'wt') as f: f.write(str(self.soup))


    def get_filter(self,words,tagname='div'):
        if isinstance(words,str): words = [words, ]
        def myfilter(tag):
            if tag.name != tagname: return False
            if words is True: return True
            keys = []
            if 'class' in tag.attrs:
                if isinstance(tag['class'],str):
                    keys.append(tag['class'])
                else:
                    keys.extend(tag['class'])
            if 'id' in tag.attrs:
                if isinstance(tag['id'],str):
                    keys.append(tag['id'])
                else:
                    keys.extend(tag['id'])
            if 'style' in tag.attrs:
                if isinstance(tag['style'],str):
                    keys.append(tag['style'])
                else:
                    keys.extend(tag['style'])
            for k in keys:
                for w in words:
                    if w in k:
                        return True
            return False
        return myfilter



tagsdict_csdn = {
    'div': [
        'display:none',
        '_wrapper',
        'csdn-toolbar',
        'container_aside',
        'recommend',
        'comment',
        'toolbar',
        'toolbox',
        'ad_58',
        'footer',
        'template',
        'confirmBox',
        'altertBox',
        'toastBox',
        'report-box',
        'bdSug',
    ],

    'iframe': [
        'google',
        'bdSug_sd',
    ],

    'aside': [
        'blog_container_aside',
    ],
}


tagsdict_zhihu = {
    'div': [
        'ColumnPage',
        'Post-Sub',
        'bottom',
    ],

    'img': [
        'TitleImage',
    ],
}

if len(sys.argv) <= 1:
    print('=>: [python3] script.py  html_file  [html_name] [csdn|zhihu]')
    print('=>: [python3] script.py  html_file  [csdn|zhihu]')
    exit()

FILE = sys.argv[1]
FOUT = FILE
td = tagsdict_csdn

if len(sys.argv) <= 2:
    print('Note: processing html csdn')

if len(sys.argv) >= 3:
    if sys.argv[2] == 'csdn':
        print('Note: processing html csdn')
        td = tagsdict_csdn
    elif sys.argv[2] == 'zhihu':
        print('Note: processing html zhihu')
        td = tagsdict_zhihu
    else:
        FOUT = sys.argv[2]

if len(sys.argv) >= 4:
    if sys.argv[3] == 'csdn':
        print('Note: processing html csdn')
        td = tagsdict_csdn
    elif sys.argv[3] == 'zhihu':
        print('Note: processing html zhihu')
        td = tagsdict_zhihu


FD = HTMLCleaner(FILE,td,fname=FOUT)
FD.run()


