#!/bin/bash

source crypto_functions.sh

function usage {
  echo "Usage: ./digitally_verify.sh [/path/to/original/file]"
  exit 1
}

function validate_input {
  if [ $# -eq 0 ]; then
    usage
  elif [ ! -f $1 ] || [ ! -f $1.dig ]; then
    echo "File to verify or the digital signature itself doesn't exist"
    usage
  elif [ "$(cat public.pem | grep BEGIN)" != "-----BEGIN RSA PUBLIC KEY-----" ]; then
    echo "Invalid public key"
    usage
  fi
}

digitally_verify $1
