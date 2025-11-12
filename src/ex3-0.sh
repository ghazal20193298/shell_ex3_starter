#!/usr/bin/env bash

# File: ex3-0.sh
# Author: 가잘 (20193298)
# Desc: 환경변수 등록 확인 (macOS용)

ZSHRC="$HOME/.zshrc"
KEY="MYENV"
VAL="Hello Shell"

if ! grep -q "^export ${KEY}=" "$ZSHRC" 2>/dev/null; then
  echo "export ${KEY}=\"${VAL}\"" >> "$ZSHRC"
  echo "[추가됨] $ZSHRC → export ${KEY}=\"${VAL}\""
else
  echo "[이미 존재] ${KEY}"
fi

source "$ZSHRC"
echo "현재 셸에서 ${KEY} = ${!KEY}"
