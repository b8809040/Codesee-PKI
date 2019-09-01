#!/bin/bash

if [ -z $1 ]; then
  echo "No file name"
fi

qrcode_list_file=$1
qrcode_list_encrypt_file=$1.encrypt.txt

rm -rf ./$1
mkdir ./$1

exec < $qrcode_list_encrypt_file

var=1

while read line
do
  #echo $line
  qrcode_image_file=$(head -$var ./$1.txt | tail -1)
  qrencode -o "./$1/$qrcode_image_file.png" $line
  var=$((var+1))
done

