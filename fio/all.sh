#!/bin/bash

FILENAME="${1:?}"

function term() {
  echo "terminated!"
  exit 0
}

function cleanup() {
    if [[ -f "$FILENAME" ]]; then
      rm -f "$FILENAME";
    fi
}

trap term INT
trap cleanup EXIT

read -p "Continue with '$FILENAME'? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  fio posixaio.ini --filename="$FILENAME"
  fio posixaio-latency.ini --filename="$FILENAME"
fi
