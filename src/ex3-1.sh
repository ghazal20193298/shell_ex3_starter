#!/usr/bin/env bash
# Author: 가잘 (20193298)
# Desc: 두 정수 사칙연산

# 인자 2개 없으면 사용법 안내
if [[ $# -ne 2 ]]; then
  echo "사용법: $0 <정수1> <정수2>"
  exit 1
fi

a="$1"; b="$2"

# 정수인지 검사 (음수 허용)
if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ ]]; then
  echo "정수만 입력하세요."
  exit 1
fi

echo "$a + $b = $((a + b))"
echo "$a - $b = $((a - b))"
echo "$a * $b = $((a * b))"

# 0으로 나누기 방지
if [[ "$b" -ne 0 ]]; then
  echo "$a / $b = $((a / b))"
  echo "$a % $b = $((a % b))"
else
  echo "0으로 나눌 수 없음"
fi
