#!/bin/bash

PACKAGES=(
  iperf3
  fio
  sysbench
)

brew install "${PACKAGES[@]}"
