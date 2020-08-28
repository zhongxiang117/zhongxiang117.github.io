#!/bin/bash


if [[ -z "$1" ]]; then { echo "Error: no inputs"; exit 1; } fi

search_string=$1

exclusions_files="
LICENSE
Makefile
package.json
README.md
requirements.txt
jekyll-rt-theme.gemspec

Gemfile
Gemfile.lock
.gitignore
.deps.sh
"

exclusions_folder="
_sass
_site
assets
test
test_long
_site_1
_site_original
"



function func_is_exclusion {
    bo=0
    for tmp in $2
    do
        if [[ $1 == $tmp ]]; then bo=1; break; fi
    done
    return $bo
}

for i in $(ls)
do
    if [[ -d $i ]]
    then
        func_is_exclusion $i "$exclusions_folder"
        bo=$?
        if [[ $bo == 1 ]]; then continue; fi

        cd $i
        for j in $(ls)
        do
            if [[ -d $j ]]
            then
                func_is_exclusion $j "$exclusions_folder"
                bo=$?
                if [[ $bo == 1 ]]; then continue; fi

                cd $j
                for k in $(ls)
                do
                    if [[ -d $k ]]
                    then
                        func_is_exclusion $k "$exclusions_folder"
                        bo=$?
                        if [[ $bo == 1 ]]; then continue; fi
                        cd $k
                        for t in $(ls)
                        do
                            if [[ ! -d $t ]]
                            then
                                func_is_exclusion $t "$exclusions_files"
                                bo=$?
                                if [[ $bo == 0 ]]
                                then
                                    echo "File ===> $i/$j/$k/$t"
                                    grep "$search_string" $t
                                fi
                            fi
                        done
                        cd ../
                    else
                        func_is_exclusion $k "$exclusions_files"
                        bo=$?
                        if [[ $bo == 0 ]]
                        then
                            echo "File ===> $i/$j/$k"
                            grep "$search_string" $k
                        fi
                    fi
                done
                cd ../
            else
                func_is_exclusion $j "$exclusions_files"
                bo=$?
                if [[ $bo == 0 ]]
                then
                    echo "File ===> $i/$j"
                    grep "$search_string" $j
                fi
            fi
        done
        cd ../
    else
        func_is_exclusion $i "$exclusions_files"
        bo=$?
        if [[ $bo == 0 ]]
        then
            echo "File ===> $i"
            grep "$search_string" $i
        fi
    fi
done



echo "DONE everyting"
