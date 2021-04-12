#!/bin/bash

PACKAGES=(
  iperf3
  fio
  sysbench
  wget
)

brew install "${PACKAGES[@]}"
