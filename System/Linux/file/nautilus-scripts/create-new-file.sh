#!/bin/bash

fname=newfile
if [[ -f $fname ]]; then
    ndx=1
    while true; do
        fnew=$fname"-$ndx"
        if [[ -f $fnew ]]; then
            ((ndx++))
        else
            fname=$fnew
            break
        fi
    done
fi

# create new file and select/highlight it
touch $fname

nautilus -s $fname

