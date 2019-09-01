#!/bin/bash
#https://www.cnblogs.com/gordon0918/p/5382541.html
#https://stackoverflow.com/questions/36115262/validate-signature-objective-c
#https://blog.csdn.net/as3luyuan123/article/details/14046375

if [ -z $1 ]; then
  echo "Please specify the file to sign"
fi

if [ ! -f $1 ]; then
  echo "File not found!"
fi

out_folder=/tmp
plain_file=$1
signed_file=$out_folder/$plain_file.sign

if [ ! -d $out_folder ]; then
  mkdir $out_folder
fi

cat $plain_file | tr -d '\n' > $plain_file.trim
mv $plain_file.trim $plain_file
#openssl dgst -sha256 -sign ./codesee_key.pem $plain_file > $signed_file
openssl dgst -sha256 -sign ./codesee_key.pem -out $signed_file.sha256 $plain_file
openssl dgst -prverify ./codesee_key.pem -sha256 -signature $signed_file.sha256 $plain_file
openssl enc -base64 -in $signed_file.sha256 -out $signed_file.enc
cat $signed_file.enc | tr -d '\n' > $signed_file.enc.trim
mv $signed_file.enc.trim $signed_file.enc

################
#https://gist.github.com/ezimuel/3cb601853db6ebc4ee49
#filename=$1
#privatekey=$2

#openssl dgst -sha256 -sign $privatekey -out /tmp/$filename.sha256 $filename
#openssl base64 -in /tmp/$filename.sha256 -out signature.sha256
#rm /tmp/$filename.sha256

