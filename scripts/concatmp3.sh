#!/bin/bash

FILES=$(ls -1 *.mp3 | sort -g)

rm audiofiles.txt

for i in $FILES
do
    printf "file '$i'\n" >> audiofiles.txt
done

ffmpeg -f concat -safe 0 -i audiofiles.txt -c copy output.mp3
