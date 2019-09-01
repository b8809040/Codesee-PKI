#!/bin/bash
# https://stackoverflow.com/questions/36115262/validate-signature-objective-c
# https://blog.csdn.net/as3luyuan123/article/details/14138983

openssl ecparam -name prime256v1 -genkey -noout -out ./codesee_key.pem
openssl ec -in ./codesee_key.pem -pubout -out ./codesee_pubkey.pem
openssl req -new -x509 -key ./codesee_key.pem -outform der -out ./codesee_cert.pem -days 730

#######
#openssl ec -in ./codesee_key.pem  -out ./codesee_pubkey2.pem -puout
