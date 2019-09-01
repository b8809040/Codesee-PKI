#!/bin/bash
# https://linuxconfig.org/using-openssl-to-encrypt-messages-and-files-on-linux

if [ -z $1 ]; then
  echo "Please specify the file to encrypt"
fi

if [ ! -f $1 ]; then
  echo "File not found!"
fi

out_folder=/tmp
plain_file=$1
encrypted_file=$out_folder/$plain_file.encrypt

if [ ! -d $out_folder ]; then
  mkdir $out_folder
fi

# remove unnecrssary characters
cat $plain_file | tr -d '\n' > $plain_file.trim
mv $plain_file.trim $plain_file

# encrypt
openssl rsautl -encrypt -inkey codesee_pubkey.pem -pubin -in $plain_file -out $encrypted_file

# base64 encode
base64 $encrypted_file > $encrypted_file.base64
#openssl enc -base64 -in $encrypted_file -out $encrypted_file.base64

# remove unnecrssary characters
cat $encrypted_file.base64 | tr -d '\n' > $encrypted_file.base64.trim
mv $encrypted_file.base64.trim $encrypted_file.base64
