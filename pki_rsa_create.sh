#!/bin/bash

openssl genrsa -out codesee_key.pem 1024

openssl rsa -in codesee_key.pem -out codesee_pubkey.pem -outform PEM -pubout
