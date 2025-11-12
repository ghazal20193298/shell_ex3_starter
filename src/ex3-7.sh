#!/usr/bin/env bash
# ex3-7.sh | macOS 기준 상태 확인

while true; do
cat <<'M'
==== 시스템 상태 ====
1) 사용자 정보 (who)
2) CPU 사용량 (top -l 1)
3) 메모리 사용량 (vm_stat)
4) 디스크 사용량 (df/du)
5) 종료
====================
M
read -rp "선택: " s
case "$s" in
  1) who;;
  2) top -l 1 | head -n 15;;
  3) vm_stat;;
  4) echo "[df -h]"; df -h; echo; echo "[홈 폴더 용량]"; du -sh "$HOME";;
  5) break;;
  *) echo "1~5 중 선택";;
esac
done
