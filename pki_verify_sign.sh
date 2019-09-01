#!/bin/bash
#https://www.cnblogs.com/gordon0918/p/5382541.html
#https://blog.csdn.net/as3luyuan123/article/details/14046375

out_folder=/tmp
plain_file=$1
signed_file=$out_folder/$plain_file.sign

openssl enc -base64 -d -in $signed_file.enc -out $signed_file.dec
openssl dgst -sha256 -verify ./codesee_pubkey.pem -signature $signed_file.dec $plain_file
#openssl dgst -sha256 -verify ./codesee_pubkey.pem -signature $signed_file.sha256 $plain_file   ## verity the encoded file

########
#https://gist.github.com/ezimuel/3cb601853db6ebc4ee49
#filename=$1
#signature=$2
#publickey=$3

#openssl base64 -d -in $signature -out /tmp/$filename.sha256
#openssl dgst -sha256 -verify $publickey -signature /tmp/$filename.sha256 $filename
#rm /tmp/$filename.sha256
