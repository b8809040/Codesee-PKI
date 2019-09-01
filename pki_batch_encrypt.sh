#!/bin/bash

if [ -z $1 ]; then
  echo "No file name"
  exit 1
fi

file=$1
input_file='./'$file'.txt'
output_file='./'$file'.encrypt.txt'

rm -f $output_file

touch $output_file

echo "Generating $file"

exec < $input_file

while read line
do
  echo $line > ./tmp # 一行一行印出內容
  ./pki_encrypt.sh ./tmp   #output /tmp/tmp.sign.enc
  cat /tmp/tmp.encrypt.base64 | awk '{ printf("%s\n",$1) }' >> $output_file
done
