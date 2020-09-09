#!/bin/bash


path_theme_source="/home/xiang/Desktop/website/jekyll-rtd-theme-master-v1.1.7"

bool_verbose=false

# check source
if [[ ! -d $path_theme_source ]]
then
    echo "Error: theme source not exist <$path_theme_source>"
    exit 1
fi


# ovarall exclusions
exclusions_all="
fonts
"


# root exclusions
exclusions="
.dpes.sh
.gitignore
LICENSE
Makefile
package.json
search.sh
_config.yml
format_css
README.md
"

# my repo source from head
my_sources="
_includes
_layouts
_sass
assets
"


tmp=$(ls $path_theme_source | grep '_site\|test')
exclusions="$exclusions $tmp"

echo "Note: processing original theme"
chgstr=()
for i in $(ls $path_theme_source)
do
    bo=false
    for ndx in $exclusions; do if [[ $i == $ndx ]]; then bo=true; break; fi; done
    if $bo; then continue; fi
    # level 1
    if [[ -f $path_theme_source/$i ]]
    then
        if $bool_verbose; then echo "Note: Level 1 -- $i"; fi
        if [[ -f $i ]]
        then
            fo="X"$(cat $path_theme_source/$i | tr -d '\r\n\t' | tr -d '[:space:]')
            fp="X"$(cat $i | tr -d '\r\n\t' | tr -d '[:space:]')
            if [[ "$fo" != "$fp" ]]
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
            bo=false
            for ndx in $exclusions_all; do if [[ $j == $ndx ]]; then bo=true; break; fi; done
            if $bo; then continue; fi
            if $bool_verbose; then echo "Note: Level 2 -- $i/$j"; fi
            if [[ -f $path_theme_source/$i/$j ]]
            then
                if [[ -f $i/$j ]]
                then
                    fo="X"$(cat $path_theme_source/$i/$j | tr -d '\r\n\t' | tr -d '[:space:]')
                    fp="X"$(cat $i/$j | tr -d '\r\n\t' | tr -d '[:space:]')
                    if [[ "$fo" != "$fp" ]]
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
                    bo=false
                    for ndx in $exclusions_all; do if [[ $k == $ndx ]]; then bo=true; break; fi; done
                    if $bo; then continue; fi
                    if $bool_verbose; then echo "Note: Level 3 -- $i/$j/$k"; fi
                    if [[ -f $path_theme_source/$i/$j/$k ]]
                    then
                        if [[ -f $i/$j/$k ]]
                        then
                            fo="X"$(cat $path_theme_source/$i/$j/$k | tr -d '\r\n\t' | tr -d '[:space:]')
                            fp="X"$(cat $i/$j/$k | tr -d '\r\n\t' | tr -d '[:space:]')
                            if [[ "$fo" != "$fp" ]]
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
                            bo=false
                            for ndx in $exclusions_all; do if [[ $s == $ndx ]]; then bo=true; break; fi; done
                            if $bo; then continue; fi
                            if $bool_verbose; then echo "Note: Level 4 -- $i/$j/$k/$s"; fi
                            if [[ -f $path_theme_source/$i/$j/$k/$s ]]
                            then
                                if [[ -f $i/$j/$k/$s ]]
                                then
                                    fo="X"$(cat $path_theme_source/$i/$j/$k/$s | tr -d '\r\n\t' | tr -d '[:space:]')
                                    fp="X"$(cat $i/$j/$k/$s | tr -d '\r\n\t' | tr -d '[:space:]')
                                    if [[ "$fo" != "$fp" ]]
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
                                    bo=false
                                    for ndx in $exclusions_all; do if [[ $t == $ndx ]]; then bo=true; break; fi; done
                                    if $bo; then continue; fi
                                    if $bool_verbose; then echo "Note: Level 5 -- $i/$j/$k/$s/$t"; fi
                                    if [[ -f $path_theme_source/$i/$j/$k/$s/$t ]]
                                    then
                                        if [[ -f $i/$j/$k/$s ]]
                                        then
                                            fo="X"$(cat $path_theme_source/$i/$j/$k/$s/$t | tr -d '\r\n\t' | tr -d '[:space:]')
                                            fp="X"$(cat $i/$j/$k/$s/$t | tr -d '\r\n\t' | tr -d '[:space:]')
                                            if [[ "$fo" != "$fp" ]]
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
echo ''
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
    if ((${#ndxstr} >= 85)); then { if $bool_verbose; then { echo "$ndxstr"; } fi; ndxstr='--->'; } fi
    bo=true
    for j in $exclusions
    do
        if [[ $cmp == *"$j"* ]]; then { bo=false; break; } fi
    done
    if $bo
    then
        for t in $exclusions_all
        do
            if [[ $cmp == *"$t"* ]]; then { bo=false; break; } fi
        done
    fi
    if $bo; then cmpstr="$cmpstr $cmp"; fi
done

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
for mf in $my_sources
do
    if ! [[ -f $mf || -d $mf ]]; then { echo "Warning: my_sources < $mf > is not find"; continue; } fi
    ndxstr='--->'
    for ndx in $(find $mf)
    do
        ndxstr="$ndxstr {$ndx}"
        if ((${#ndxstr} >= 85)); then { if $bool_verbose; then { echo "$ndxstr"; } fi; ndxstr='--->'; } fi
        bo=true
        for cmp in $cmpstr
        do
            if [[ $ndx == *"$cmp"* ]]; then { bo=false; break; } fi
        done
        if $bo; then extras+=("$ndx"); fi
    done
done

if ((${#extras[*]} > 0)); then { echo ''; echo "Note: extra files"; } fi
for ((i=0; $i<${#extras[*]}; i++))
do
    echo "${extras[$i]}"
done




echo "DONE everything"



