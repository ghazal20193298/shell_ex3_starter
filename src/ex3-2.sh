#!/usr/bin/env bash
# Author: 가잘 (20193298)
# Desc: y = 1/2 * x^2 계산 (실수 입력 가능)

if [[ $# -lt 1 ]]; then
  echo "사용법: $0 <x값1> <x값2> ..."
  exit 1
fi

for x in "$@"; do
  # bc로 실수 계산 (scale=6 → 소수점 6자리)
  y=$(echo "scale=6; 0.5 * ($x ^ 2)" | bc -l)
  echo "x=$x → y=$y"
done
