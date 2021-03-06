#!/bin/bash

# find keyword in include_path
# at the same getting rid of exclusions

if [[ -z "$1" ]]; then { echo "Error: no inputs"; exit 1; } fi

search_string=$1

include_path="
_includes
_layouts
_sass
assets
"


exclusions_files="
"

exclusions_folder="
js
fonts
rougify
"



function func_is_exclusion {
    bo=0
    for tmp in $2
    do
        if [[ $1 == $tmp ]]; then bo=1; break; fi
    done
    return $bo
}

for i in ${include_path}
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
    elif [[ -f $i ]]
    then
        func_is_exclusion $i "$exclusions_files"
        bo=$?
        if [[ $bo == 0 ]]
        then
            echo "File ===> $i"
            grep "$search_string" $i
        fi
    else
        echo "Warning: wrong inputs ${i}"
    fi
done



echo "DONE everyting"
