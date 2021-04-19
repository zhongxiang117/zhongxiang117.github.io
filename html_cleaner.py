#!/usr/bin/env python3

import sys
from bs4 import BeautifulSoup
import argparse


FEATURES = [
    'version 0.1    : HTMLCleaner',
    'version 0.2    : add filter for cnblog',
]


VERSION = FEATURES[-1].split(':')[0].strip()


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

        print('Note: html file is saved to <{:}>'.format(self.fname))
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


tagsdict_cnblog = {
    'div': [
        'blogTitle',
        'sideBar',
        'comment',
        'sideToolbar',
        'navbar',
        'page_begin_html',
        'header',
        'div_digg',
        'footer',
        'under-post-card',
        'postDesc',
    ],
}



parser = argparse.ArgumentParser(description='HTML Cleaner',allow_abbrev=False)
parser.add_argument(
    '-v','--version',
    action='version',
    version='HTMLCleaner '+VERSION
)
parser.add_argument(
    '-f','--file',
    help='input html file'
)
parser.add_argument(
    '-o','--fname',
    help='output file name, if not defined, overwritten may happen'
)
parser.add_argument(
    '-t','--type',
    help='support html type, [csdn|zhihu|cnblog]'
)
parser.add_argument(
    '--features',
    help='show development features and exit',
    action='store_true'
)


if len(sys.argv) == 1:
    parser.print_help()
    exit()


args = parser.parse_args(sys.argv[1:])
if args.features:
    for i in FEATURES:
        print(i)
    exit()


if args.file is None:
    print('Warning: -f/--files html is missing')
    exit()


if args.type.lower() == 'zhihu':
    print('Note: processing html type <zhihu>')
    td = tagsdict_zhihu
elif args.type.lower() == 'cnblog':
    print('Note: processing html type <cnblog>')
    td = tagsdict_cnblog
else:
    print('Note: processing html type <csdn>')
    td = tagsdict_csdn


FILE = args.file
FOUT = FILE if args.fname is None else args.fname

FD = HTMLCleaner(FILE,td,fname=FOUT)
FD.run()


