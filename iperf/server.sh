#!/bin/bash

PORT="${PORT:-5201}"    # Optional
IP="${IP:-}"            # Optional

IP_OPTION=""
if [[ ! -z "$IP" ]]; then
  IP_OPTION=("--bind" "$IP")
fi

iperf3 --server --port "$PORT" "${IP_OPTION[@]}"
