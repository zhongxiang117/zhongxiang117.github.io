#!/bin/bash


path_theme_source="/home/xiang/Desktop/jekyll-rtd-theme"



core_folders='
_includes
_layouts
_sass
assets
'

core_files='
Gemfile
Gemfile.lock
jekyll-rtd-theme.gemspec
requirements.txt
'


# check source
if [[ ! -d $path_theme_source ]]
then
    echo "Error: theme source not exist <$path_theme_source>"
    exit 1
fi

bo=false
for i in $core_files
do
    if [[ ! -f $path_theme_source/$i ]]
    then
        bo=true
        echo "Warning: core_files <$path_theme_source/$i> not exist"
    fi
done
for i in $core_folders
do
    if [[ ! -d $path_theme_source/$i ]]
    then
        bo=true
        echo "Warning: core_folders <$path_theme_source/$i> not exist"
    fi
done

if $bo; then { echo "More decision needs to be made"; exit 0; } fi


# now, do the updating
for i in $core_files
do
    echo "Note: updating file <$i>"
    rm -f $i
    cp $path_theme_source/$i .
done

for i in $core_folders
do
    echo "Note: updating folder <$i>"
    rm -rf $i
    cp -r $path_theme_source/$i .
done







