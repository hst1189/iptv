#! /usr/bin/env bash

function read_dir(){
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]  //注意此处之间一定要加上空格，否则会报错
        then
            read_dir $1"/"$file
        else
            echo $1"/"$file
        fi
    done
}
#测试目录 test
read_dir test

