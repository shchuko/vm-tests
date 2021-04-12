#!/bin/bash

THREADS="${1:-$(sysctl -n hw.ncpu)}"

TEST_SINGLE="sysbench cpu --cpu-max-prime=20000 --threads=1 run"
TEST_MULTY="sysbench cpu --cpu-max-prime=20000 --threads=$THREADS run"

function sep() {
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

echo "Exec: $TEST_SINGLE"
eval "$TEST_SINGLE"

sep
echo "Exec: $TEST_MULTY"
eval "$TEST_MULTY"
