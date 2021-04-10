#!/bin/bash

ADDRESS="${1:?}"  # Required
PORT="${2:-5201}" # Optional

if [[ "$(uname)" != "Darwin" ]]; then
  echo "Unable to retrieve cpu count"
  exit 1
fi

NCPU="$(sysctl -n hw.ncpu)"

echo "iperf3: client,reversed,parallel[$NCPU streams]"
iperf3 --client "$ADDRESS" --port "$PORT" --reverse --parallel "$NCPU"
