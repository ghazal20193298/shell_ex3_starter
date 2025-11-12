#!/usr/bin/env bash
# ex3-6.sh | 실행파일 시작/끝, 인자 출력, 파일 실행

if [[ $# -lt 2 ]]; then echo "사용법: $0 <실행파일|.py> <인자1> [인자...]"; exit 1; fi
exe="$1"; shift
echo "[시작]" "$(date)"
echo "[실행파일]" "$exe"
echo "[인자]" "$*"

if [[ -x "$exe" ]]; then
  "$exe" "$@"
elif [[ "$exe" =~ \.py$ ]]; then
  python3 "$exe" "$@"
else
  echo "실행 불가 또는 확장자 미지원"
fi
echo "[끝]" "$(date)"
