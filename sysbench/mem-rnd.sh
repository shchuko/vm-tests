#!/bin/bash

THREADS="${1:-$(sysctl -n hw.ncpu)}"

TEST_SINGLE_1K="sysbench memory --memory-access-mode=rnd --memory-block-size=1K --threads=1 run"
TEST_MULTY_1K="sysbench memory --memory-access-mode=rnd --memory-block-size=1K --threads=$THREADS run"

TEST_SINGLE_1M="sysbench memory --memory-access-mode=rnd --memory-block-size=1M --threads=1 run"
TEST_MULTY_1M="sysbench memory --memory-access-mode=rnd --memory-block-size=1M --threads=$THREADS run"

function sep() {
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

echo "Exec: $TEST_SINGLE_1K"
eval "$TEST_SINGLE_1K"

sep
echo "Exec: $TEST_MULTY_1K"
eval "$TEST_MULTY_1K"

sep
echo "Exec: $TEST_SINGLE_1M"
eval "$TEST_SINGLE_1M"

sep
echo "Exec: $TEST_MULTY_1M"
eval "$TEST_MULTY_1M"
