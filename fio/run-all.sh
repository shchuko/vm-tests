#!/bin/bash

FILENAME="${1:?}"

function term() {
  echo "terminated!"
  exit 0
}

trap term INT

read -p "Continue with '$FILENAME'? [y/N] " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  fio posixaio.ini --filename="$FILENAME"
  fio posixaio-latency.ini --filename="$FILENAME"
fi

rm "$FILENAME"