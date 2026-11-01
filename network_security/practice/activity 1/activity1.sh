#!/usr/bin/env bash
# Activity 1 - Footprinting / Scanning / Enumeration
# Run all parts:     bash activity1.sh
# Run one part:      PART=2 bash activity1.sh
# Only this machine (127.0.0.1 / own LAN IP) and public DNS/HTTP data is touched.

set -u
PART="${PART:-all}"
PAUSE="${PAUSE:-1}"      # PAUSE=0 -> no pause, no clear
OUT="activity1-output.txt"
MYIP=$(ip -4 -o addr show scope global | awk '$2!="docker0" && $2!="shark0" {print $4}' | cut -d/ -f1 | head -1)
TARGET_IP=$(getent ahostsv4 example.com | awk 'NR==1{print $1}')
[ "$PART" = "all" ] && : > "$OUT"

log()  { echo "$*" | tee -a "$OUT"; }
run()  { log ""; log "\$ $1"; eval "$1" 2>&1 | tee -a "$OUT"; }
step() {
  [ "$PAUSE" = "1" ] || return
  echo
  read -rp ">>> Screenshot this part, then press ENTER for the next one... " _
  clear
}
header() {
  log "=================================================================="
  log "  Network Security - Activity 1 | $1"
  log "=================================================================="
  log "  User      : $(whoami)"
  log "  Host      : $(hostname)"
  log "  Date      : $(date '+%Y-%m-%d  %H:%M:%S %Z')"
  log "  Local IP  : ${MYIP}"
  log "=================================================================="
}

part1() {
  header "Part 1: Footprinting"
  run "resolvectl --legend=no query example.com"
  run "resolvectl --legend=no query -t NS example.com"
  run "curl -s --max-time 10 https://ipinfo.io/${TARGET_IP}/json | jq '{ip, city, country, org}'"
  run "curl -sI --max-time 10 https://example.com | head -6"
}

part2() {
  header "Part 2: Scanning with Nmap"
  run "nmap -sn ${MYIP}"
  run "nmap -sT -sV --top-ports 1000 127.0.0.1"
}

part3() {
  header "Part 3: Enumeration"
  run "ss -lntp | head -12"
  run "ip neigh"
  run "nmblookup -s /dev/null -A ${MYIP}"
  run "smbclient -s /dev/null -L //${MYIP} -N"
}

[ "$PAUSE" = "1" ] && clear

case "$PART" in
  1) part1 ;;
  2) part2 ;;
  3) part3 ;;
  *)
    part1; step; part2; step; part3
    echo
    echo "Full output saved to: $(pwd)/$OUT"
    echo "Screenshots needed: part 1, part 2, part 3 (desktop visible in each)."
    [ "$PAUSE" = "1" ] && read -rp ">>> Press ENTER to finish... " _
    ;;
esac
exit 0
