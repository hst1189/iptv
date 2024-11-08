#! /usr/bin/env bash

dirwork=""
function read_dir(){
  for file in `ls $1`
  do
    if [ -d $1"/"$file ]; then
        echo "―folder: "$file
        if [ ! -d ${GITHUB_WORKSPACE}/local/api/$file ]; then
            mkdir -p ${GITHUB_WORKSPACE}/local/api/$file
        fi
        dirwork=$file"/"
        read_dir $1"/"$file
    else
        echo "⊥file: "$file
        iptv-checker -o ${GITHUB_WORKSPACE}/local/output -p 100 -t 60000 $1"/"$file
        cp -pr ${GITHUB_WORKSPACE}/local/output/online.m3u ${GITHUB_WORKSPACE}/local/api/$dirwork$file
    fi
  done
}
