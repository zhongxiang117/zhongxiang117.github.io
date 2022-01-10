#!/usr/bin/env python3

import time
import sys
from bs4 import BeautifulSoup
import argparse


FEATURES = [
    'version 0.1    : HTMLCleaner',
    'version 0.2    : add filter for cnblog',
    'version 0.3    : more advanced',
    'version 0.3.1  : minor fixes',
    'version 0.4    : RELEASEing',
    'version 0.5    : add option -rg',
]


VERSION = FEATURES[-1].split(':')[0].strip()


def combinedicts(d1, d2):
    """
    for example:
        d1 = {k1:v1, k2:v2, k3:v3, ...}
        d2 = {k2:v4, k3:v5, k4:v6, ...}

        combine them will return:
            d = {k1:[v1, ], k2:[v2, v4, ], k3:[v3, v5], k4:[v6, ], ...}

        if v1,v2... are lists, they will be flatten.
    """
    totdicts = {}
    for k in set(d1.keys()) | set(d2.keys()):
        totdicts[k] = []
        if k in d1:
            if isinstance(d1[k],list):
                totdicts[k].extend(d1[k])
            else:
                totdicts[k].append(d1[k])
        if k in d2:
            if isinstance(d2[k],list):
                totdicts[k].extend(d2[k])
            else:
                totdicts[k].append(d2[k])
        totdicts[k] = list(set(totdicts[k]))
        if None in totdicts[k]: totdicts[k].remove(None)
    return totdicts


class HTMLCleaner:
    """Clean saved HTML file to make it more tidy and compact

    Args:
        html (str): input html file
        tagsdict (dict): {tag:words}: html tag, any its attrs contains string
            in words will be decomposed, words can be (str|list|True),
            if words is True, the tag will be removed. 
        fname (str): save file, if it is None, input html will be overwritten
        delimiter (str): delimiter for separate file name, default is '-'
    """
    def __init__(self,html,tagsdict,fname=None,delimiter=None):
        self.html = html
        self.tagsdict = tagsdict
        self.delimiter = '-' if delimiter is None else delimiter
        self.fname = html[:html.rfind('.')] if fname is None else fname
        # time stamp
        if '--' in self.fname: self.fname = self.fname[:self.fname.rfind('--')]
        self.fname = self.fname.strip() + time.strftime('--%Y %b %d %H %M.html')
        self.fname = self.delimiter.join(self.fname.split())
        with open(html,'rt') as f: contents = f.read()
        self.soup = BeautifulSoup(contents,'html.parser')

    def run(self):
        for tagname,v in self.tagsdict.items():
            mf = self.get_filter(v,tagname)
            tags = self.soup.find_all(mf)
            for i in tags: i.decompose()
        print('Note: processed html file is saved to <{:}>'.format(self.fname))
        with open(self.fname,'wt') as f: f.write(str(self.soup))

    def get_filter(self,words,tagname='div'):
        if not isinstance(words,list): words = [words, ]
        def myfilter(tag):
            if tag.name != tagname: return False
            if True in words: return True
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


MYTYPES = {
    'csdn': {
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
            'blogColumnPayAdvert',
        ],
        'iframe': [
            'google',
            'bdSug_sd',
        ],
        'aside': [
            'blog_container_aside',
        ],
    },
    'zhihu': {
        'div': [
            'ColumnPage',
            'Post-Sub',
            'bottom',
            'Post-topicsAndReviewer',
            'Sticky--holder',
            'CornerButtons',
        ],
        'img': [
            'TitleImage',
        ],
        'button': [
            'FollowButton',
        ]
    },
    'zhihuQA': {
        'div': [
            'Sticky',
            'Sticky--holder',
            'List-header',
            'data-zop-question',
            'QuestionStatus',
            'QuestionHeader',
            'Comments-container',
        ],
        'header': True,
    },
    'cnblog': {
        'div': [
            'bannerbar',
            'top_nav',
            'page_begin_html',
            'header',
            'blog_post_info_block',
            'postDesc',
            'blog-comments-placeholder',
            'comment_form',
            'footer',
            'sideBarMain',
        ],
    },
    'weixin': {
        'div': [
            'qr_code_pc_outer',
            'rich_media_area_extra',
        ],
    },
    'geeks4geeks': {
        'aside': True,
        'div': [
            'login-modal-div',
            'header-main__container',
            'header-main__wrapper',
            'header-main__slide',
            'sideBar--wrap',
            'tooltip',
            'widget-area',
            'textBasedMannualAds',
            'editor-buttons-container',
            '_ap_apex_ad',
            'article-meta',
            'article--recommende',
            'inArticle-disqus',
            'side--container',
            'cookie-consent',
            'shell',
        ],
        'footer': True,
        'button': True,
        'iframe': True,
    },
    'cppdocs': {
        'div': [
            'I_bottom',
            'I_top',
            'I_nav',
            'C_support',
        ],
        'table': 'C_docPrevNext',
        'td': 'C_btnholder',
    
    },
    
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
    '-d','--delimiter',
    help='default is "-"'
)
parser.add_argument(
    '-o','--fname',
    help='output file name, please do not append its suffix'
)
parser.add_argument(
    '-t','--type',
    help='builtin predefined html type: ['+'|'.join(MYTYPES)+']'
)
parser.add_argument(
    '-g','--tags',
    nargs='+',
    help='multiple tags to be removed, see --props for more info'
)
parser.add_argument(
    '-p','--props',
    nargs='+',
    help=(
        'Properties for tags to be removed with the considerations of --type. '
        'Options --tags/--props are only the supplements, yet more advanced. '
        'If all three of them are omitted, nothing will be processed. '
        'In rules: --type will be in the first place processed if defined; '
        '--tags & --props will be collected into pairs: {tag1: props}, '
        '{tag2: props}...; if --tags is omitted, ["div"] will be used instead.'
    )
)
parser.add_argument(
    '-rg','--remove-tags',
    nargs='+',
    metavar='TAGS',
    help=(
        'Multiple tags to be removed. It is different with the option -g, '
        'tags input in here will be fully removed, rather than with the '
        'consideration of option -p, which is equivalent with the empty -g. '
        'For example, "htmlCleaner.py -f FILE -g tag1 tag2" (no -p is defiend) '
        'equals to "htmlCleaner.py -rg tag1 tag2 ..."'
    )
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
    print('Warning: -f/--file html is missing')
    exit()

if args.type is None:
    tagsdict = {}
else:
    if args.type in MYTYPES:
        print('Note: processing predefined html type <{:}>'.format(args.type))
        tagsdict = MYTYPES[args.type]
    else:
        print('Warning: not predefined file type: {:}'.format(args.type))
        tagsdict = {}

if args.remove_tags is None or not len(args.remove_tags):
    pass
else:
    tagsdict = { i: True for i in args.remove_tags }

if args.tags is None or not len(args.tags):
    if args.props is None or not len(args.props):
        if not len(tagsdict):
            print('Warning: nothing is defined, exit..')
            exit()
        userdicts = {}
    else:
        userdicts = {'div':args.props}
else:
    tmp = True if args.props is None or not len(args.props) else args.props
    userdicts = {i:tmp for i in args.tags}

# take care of repeated tags
## tagsdict.update(userdicts)   wrong!
totdicts = combinedicts(tagsdict, userdicts)

FD = HTMLCleaner(args.file,totdicts,fname=args.fname,delimiter=args.delimiter)
FD.run()


