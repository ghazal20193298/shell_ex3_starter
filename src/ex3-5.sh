#!/usr/bin/env bash
# ex3-5.sh | 내부함수/옵션 전달/ eval 참고

run_cmd(){ # $1=명령, $2..=옵션
  local cmd="$1"; shift || true
  echo "[실행] $cmd $*"
  eval "$cmd $*"
}

run_cmd "ls" "-al"
# 필요하면 아래처럼 직접 입력받아 실행도 가능
# read -rp "명령 입력: " line; run_cmd $line
