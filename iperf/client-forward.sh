#!/bin/bash

ADDRESS="${1:?}"    # Required
PORT="${2:-5201}"   # Optional

echo "iperf3: client,forward"
iperf3 --client "$ADDRESS" --port "$PORT"
