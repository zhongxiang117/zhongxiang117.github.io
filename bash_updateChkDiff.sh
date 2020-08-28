#!/bin/bash


path_theme_source="/home/xiang/Desktop/website/jekyll-rtd-theme"


# check source
if [[ ! -d $path_theme_source ]]
then
    echo "Error: theme source not exist <$path_theme_source>"
    exit 1
fi


exclusions="
test
test_long
_site
_site_1
_site_original
_site_2
.dpes.sh
.gitignore
LICENSE
Makefile
package.json
search.sh
_config.yml
format_css
"
tmp=$(ls $path_theme_source | grep '_site_')
exclusions="$exclusions $tmp"


chgstr=()
for i in $(ls $path_theme_source)
do
    bo=false
    for ndx in $exclusions; do if [[ $i == $ndx ]]; then bo=true; break; fi; done
    if $bo; then continue; fi
    # level 1
    if [[ -f $path_theme_source/$i ]]
    then
        echo "Note: Level 1 -- $i"
        if [[ -f $i ]]
        then
            if [[ -n $(diff $path_theme_source/$i $i) ]]
            then
                chgstr+=("$i")
            fi
        else
            chgstr+=("$i")
        fi
    else
        # level 2
        for j in $(ls $path_theme_source/$i)
        do
            echo "Note: Level 2 -- $i/$j"
            if [[ -f $path_theme_source/$i/$j ]]
            then
                if [[ -f $i/$j ]]
                then
                    if [[ -n $(diff $path_theme_source/$i/$j $i/$j) ]]
                    then
                        chgstr+=("$i/$j")
                    fi
                else
                    chgstr+=("$i/$j")
                fi
            else
                # level 3
                for k in $(ls $path_theme_source/$i/$j)
                do
                    echo "Note: Level 3 -- $i/$j/$k"
                    if [[ -f $path_theme_source/$i/$j/$k ]]
                    then
                        if [[ -f $i/$j/$k ]]
                        then
                            if [[ -n $(diff $path_theme_source/$i/$j/$k $i/$j/$k) ]]
                            then
                                chgstr+=("$i/$j/$k")
                            fi
                        else
                            chgstr+=("$i/$j/$k")
                        fi
                    else
                        # level 4
                        for s in $(ls $path_theme_source/$i/$j/$k)
                        do
                            echo "Note: Level 4 -- $i/$j/$k/$s"
                            if [[ -f $path_theme_source/$i/$j/$k/$s ]]
                            then
                                if [[ -f $i/$j/$k/$s ]]
                                then
                                    if [[ -n $(diff $path_theme_source/$i/$j/$k/$s $i/$j/$k/$s) ]]
                                    then
                                        chgstr+=("$i/$j/$k/$s")
                                    fi
                                else
                                    chgstr+=("$i/$j/$k/$s")
                                fi
                            else
                                # level 5
                                for t in $(ls $path_theme_source/$i/$j/$k/$s)
                                do
                                    echo "Note: Level 5 -- $i/$j/$k/$s/$t"
                                    if [[ -f $path_theme_source/$i/$j/$k/$s/$t ]]
                                    then
                                        if [[ -f $i/$j/$k/$s ]]
                                        then
                                            if [[ -n $(diff $path_theme_source/$i/$j/$k/$s/$t $i/$j/$k/$s/$t) ]]
                                            then
                                                chgstr+=("$i/$j/$k/$s/$t")
                                            fi
                                        else
                                            chgstr+=("$i/$j/$k/$s/$t")
                                        fi
                                    else
                                        echo "Warning: Please check <$path_theme_source/$i/$j/$k/$s>"
                                        echo "Note: press enter to continue"
                                        read tmp
                                    fi
                                done
                            fi
                        done
                    fi
                done
            fi
        done
    fi
done
echo ''
echo "Note: Check difference is done"
echo ''
echo "Note: File need to be updated, press enter to continue"
for ((i=0; $i<${#chgstr[*]}; i++))
do
    echo "${chgstr[$i]}"
done
echo ''
echo ''
read tmp

echo "Note: processing original < $path_theme_source >"
echo ''
cmpstr=''
ndxstr='--->'
for cmp in $(find $path_theme_source -not -path '*/.git*')
do
    cmp=${cmp##*/}
    ndxstr="$ndxstr {$cmp}"
    if ((${#ndxstr} >= 85)); then { echo "$ndxstr"; ndxstr='--->'; } fi
    bo=true
    for j in $exclusions
    do
        if [[ -n "$(echo $cmp | grep $j)" ]]; then { bo=false; break; } fi
    done
    if $bo; then cmpstr="$cmpstr $cmp"; fi
done
echo ''
echo "Note: processing ndx to unique..."
echo ''
cmplist=($cmpstr)
cmpstr="${cmplist[0]}"
for ((i=1; $i<${#cmplist[*]}; i++))
do
    bo=true
    for ((j=0; $j<$i; j++))
    do
        if [[ ${cmplist[i]} == ${cmplist[j]} ]]; then { bo=false; break; } fi
    done
    if $bo; then cmpstr="$cmpstr ${cmplist[$i]}"; fi
done

echo "Note: processing current folder"
echo ''
extras=()
for ndx in $(find . -not -path '*/.git*')
do
    echo "---> {$ndx}"
    bo=true
    for cmp in $cmpstr
    do
        if [[ -n "$(echo $ndx | grep $cmp)" ]]; then { bo=false; break; } fi
    done
    if $bo; then extras+=("$ndx"); fi
done

echo ''
echo "Note: extra files"
for ((i=0; $i<${#extras[*]}; i++))
do
    echo "${extras[$i]}"
done




echo "DONE everything"



