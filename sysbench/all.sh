#!/bin/bash

function sep() {
  echo "=================================================="
}

./cpu.sh
sep
./mem-rnd.sh
sep
./mem-seq.sh
sep
./threads.sh
