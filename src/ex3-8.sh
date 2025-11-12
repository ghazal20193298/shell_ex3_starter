#!/usr/bin/env bash
# ex3-8.sh | DB 폴더 생성/압축, train에 5개 링크

set -e
BASE="$(pwd)"
DB_DIR="$BASE/DB"
TRAIN_DIR="$BASE/train"

mkdir -p "$DB_DIR"
for i in {1..5}; do echo "sample $i" > "$DB_DIR/file$i.txt"; done

tar -czf "$BASE/db_files.tar.gz" -C "$DB_DIR" .
mkdir -p "$TRAIN_DIR"
for i in {1..5}; do ln -sf "$DB_DIR/file$i.txt" "$TRAIN_DIR/file$i.txt"; done

echo "[완료] DB생성, 압축(db_files.tar.gz), train 링크"
