#!/bin/bash

source crypto_functions.sh

function usage {
  echo "Usage: ./digitally_sign.sh [/path/to/file/to/sign]"
  exit 1
}

function validate_input {
  if [ $# -eq 0 ]; then
    usage
  elif [ ! -f $1 ]; then
    echo "File to sign doesn't exist"
    usage
  elif [ "$(cat private.pem | grep BEGIN)" != "-----BEGIN RSA PRIVATE KEY-----" ]; then
    echo "Invalid private key"
    usage
  fi
}

digitally_sign $1