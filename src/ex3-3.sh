#!/usr/bin/env bash
# ex3-3.sh  | 점수(0~100) 다수 → 각 등급(A/B), 평균/평균등급

if [[ $# -lt 2 ]]; then echo "사용법: $0 <점수1> <점수2> ..."; exit 1; fi
sum=0; n=0
for s in "$@"; do
  if ! [[ "$s" =~ ^[0-9]+$ ]] || (( s<0 || s>100 )); then echo "점수는 0~100"; exit 1; fi
  ((n++)); ((sum+=s))
  [[ $s -ge 90 ]] && g="A" || g="B"
  echo "점수 $s → 등급 $g"
done
avg=$(echo "scale=2; $sum/$n" | bc -l)
[[ $(echo "$avg >= 90" | bc) -eq 1 ]] && avg_g="A" || avg_g="B"
echo "평균: $avg → 평균 등급: $avg_g"
