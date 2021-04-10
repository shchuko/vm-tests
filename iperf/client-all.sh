#!/bin/bash

ADDRESS="${1:?}"  # Required
PORT="${2:-5201}" # Optional

function sep() {
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

function term() {
  sep
  echo "terminated!"
  exit 0
}
trap term INT

./client-forward.sh "$ADDRESS" "$PORT"
sep
./client-forward-parallel.sh "$ADDRESS" "$PORT"
sep
./client-reversed.sh "$ADDRESS" "$PORT"
sep
./client-reversed-parallel.sh "$ADDRESS" "$PORT"
