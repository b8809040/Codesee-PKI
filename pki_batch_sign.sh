#!/bin/bash

if [ -z $1 ]; then
  echo "No page number"
fi

file=qrcode_list_$1
input_file='./'$file'.txt'
output_file='./'$file'.sign.txt'

rm -f $output_file

touch $output_file

echo "Generating $file"

exec < $input_file

while read line
do
  echo $line > ./tmp # 一行一行印出內容
  ./pki_sign.sh ./tmp   #output /tmp/tmp.sign.enc
  cat /tmp/tmp.sign.enc | awk '{ printf("%s\n",$1) }' >> $output_file
done
