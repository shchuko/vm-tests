#!/bin/bash

ADDRESS="${1:?}"    # Required
PORT="${2:-5201}"   # Optional

echo "iperf3: client,reversed"
iperf3 --client "$ADDRESS" --port "$PORT" --reverse
