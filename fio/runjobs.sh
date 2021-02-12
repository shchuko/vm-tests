#!/bin/bash

if [[ "$#" < 1 ]]; then
  echo "Wrong args. Provide a filename"
  exit 1
fi

function term() {
  echo "terminated!"
  exit 0
}

trap term INT

read -p "Continue with $1? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  while read -r JOB_NAME; do
    fio "$JOB_NAME" --filename="$1"
    echo "----------------------------"
  done < <(find . -name "*.fio" -maxdepth 1 | sort)
fi

echo "Done!"
