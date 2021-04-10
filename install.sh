#!/bin/bash

PACKAGES=(
  iperf3
  fio
)

brew install "${PACKAGES[@]}"
