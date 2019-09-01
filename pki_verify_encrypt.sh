#!/bin/bash
# https://linuxconfig.org/using-openssl-to-encrypt-messages-and-files-on-linux

if [ -z $1 ]; then
  echo "Please specify the file to verify"
fi

if [ ! -f $1 ]; then
  echo "File not found!"
fi

out_folder=/tmp
plain_file=$1
encrypted_file=$out_folder/$plain_file.encrypt
verify_file=$out_folder/$plain_file.verify

if [ ! -d $out_folder ]; then
  mkdir $out_folder
fi

# base64 decode
base64 -d $encrypted_file.base64 > $encrypted_file.base64.decode
#openssl enc -base64 -d -in $encrypted_file.base64 -out $encrypted_file.base64.decode

# decrypt
openssl rsautl -decrypt -inkey codesee_key.pem -in $encrypted_file.base64.decode -out $verify_file
