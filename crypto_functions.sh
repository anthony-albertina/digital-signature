#!/bin/bash

# https://www.devco.net/archives/2006/02/13/public_-_private_key_encryption_using_openssl.php

function digitally_sign { # $1 is file to sign
  md5sum $1 | awk -F ' ' '{print $1}' > $1.md5
  openssl rsautl -sign -inkey private.pem -in $1.md5 -out $1.dig
  rm $1.md5
}

function digitally_verify { # $1 is original file,
  file_hash=$(md5sum $1 | awk -F ' ' '{print $1}')
  verified_hash=$(openssl rsautl -verify -inkey public.pem -in $1.dig -pubin)
  echo "file hash is" $file_hash
  echo "digitally verified hash is" $verified_hash
  if ! [ $file_hash == $verified_hash ]; then
    echo "signature invalid!"
  else
    echo "signature valid!"
  fi
}

function check_for_existing_keys {
  if [ -f private.pem ] || [ -f public.pem ]; then
    echo "There are currently private and public key files in ${PWD}. Please manage and move them before running this"
    exit 1
  fi
}

function asymmetric_keygen {
  check_for_existing_keys
  openssl genrsa -out private.pem 1024 > /dev/null
  openssl rsa -in private.pem -out public.pem -outform PEM -pubout > /dev/null
}



