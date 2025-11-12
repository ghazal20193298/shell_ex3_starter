#!/usr/bin/env bash
# ex3-4.sh | 점수 메뉴 프로그램

DB="./scores.txt"; touch "$DB"

to_gpa(){ # 90↑ A(4.0) / 그외 B(3.0)
  local a="$1"
  if [[ $(echo "$a >= 90" | bc) -eq 1 ]]; then echo "4.0 (A)"; else echo "3.0 (B)"; fi
}

while true; do
cat <<'M'
=====================
1) 과목 성적 추가
2) 입력된 모든 점수 보기
3) 평균 점수 확인
4) 평균 등급(GPA) 변환
5) 종료
=====================
M
read -rp "선택: " s
case "$s" in
  1) read -rp "과목명: " sub; read -rp "점수(0~100): " sc
     [[ "$sc" =~ ^[0-9]+$ ]] && ((sc>=0&&sc<=100)) || { echo "형식오류"; continue; }
     echo "$sub,$sc" >> "$DB"; echo "[저장] $sub=$sc";;
  2) echo "--- 모든 점수 ---"; cat "$DB";;
  3) [[ -s "$DB" ]] || { echo "데이터 없음"; continue; }
     avg=$(awk -F, '{s+=$2;n++}END{if(n) printf "%.2f\n",s/n}' "$DB"); echo "평균: $avg";;
  4) [[ -s "$DB" ]] || { echo "데이터 없음"; continue; }
     avg=$(awk -F, '{s+=$2;n++}END{if(n) printf "%.2f\n",s/n}' "$DB"); echo "GPA: $(to_gpa "$avg")";;
  5) echo "종료"; break;;
  *) echo "1~5 중 선택";;
esac
done
