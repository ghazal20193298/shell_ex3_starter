#!/usr/bin/env bash
# ex3-9.sh | 이름/생일/전화 DB.txt + 날짜별 작업로그

DB="./DB.txt"; LOGDIR="./logs"; mkdir -p "$LOGDIR"; touch "$DB"

add_member(){
  read -rp "이름: " n
  read -rp "생일(YYYY-MM-DD): " b
  read -rp "전화: " p
  echo "$n|$b|$p" >> "$DB"
  echo "[저장] $n"
}
list_all(){ echo "--- DB 전체 ---"; nl -ba "$DB"; }
search_name(){ read -rp "검색 이름: " k; grep -n "$k" "$DB" || echo "없음"; }
log_add(){ read -rp "날짜(YYYY-MM-DD): " d; read -rp "내용: " m; echo "[$(date '+%H:%M:%S')] $m" >> "$LOGDIR/LOG_${d}.txt"; echo "[기록] $LOGDIR/LOG_${d}.txt"; }
log_show(){ read -rp "날짜(YYYY-MM-DD): " d; f="$LOGDIR/LOG_${d}.txt"; [[ -f "$f" ]] && cat "$f" || echo "기록 없음"; }

while true; do
cat <<'M'
========== 메뉴 ==========
1) 팀원 정보 추가
2) 전체 보기
3) 이름 검색
4) 날짜별 수행내용 기록 추가
5) 날짜별 수행내용 보기
6) 종료
=========================
M
read -rp "선택: " s
case "$s" in
  1) add_member;;
  2) list_all;;
  3) search_name;;
  4) log_add;;
  5) log_show;;
  6) echo "종료"; break;;
  *) echo "1~6 중 선택";;
esac
done
