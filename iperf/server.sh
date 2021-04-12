#!/bin/bash

PORT="${PORT:-5201}"    # Optional
ADDRESS="${ADDRESS:-}"            # Optional

IP_OPTION=""
if [[ ! -z "$ADDRESS" ]]; then
  IP_OPTION=("--bind" "$ADDRESS")
fi

iperf3 --server --port "$PORT" "${IP_OPTION[@]}"
