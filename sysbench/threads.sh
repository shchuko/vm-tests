#!/bin/bash

THREADS="${1:-100}"

TEST="sysbench threads --threads=$THREADS run"
echo "Exec: $TEST"
eval "$TEST"
