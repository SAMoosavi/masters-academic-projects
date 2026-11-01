#!/usr/bin/env bash
# Runs each part of activity1.sh in a real terminal on a spare workspace,
# captures the full screen with grim, then returns to the original workspace.
set -u
cd "$(dirname "$0")"
SHOT="screenshots"
MON="${MON:-eDP-1}"
WS="${WS:-10}"
TMP="/tmp/opencode"
mkdir -p "$SHOT" "$TMP"

focus() { hyprctl dispatch "hl.dsp.focus({ $1 })" >/dev/null; }

pkill -f "foot .*cehlab" 2>/dev/null; sleep 0.5

OLDMON=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
OLDWS=$(hyprctl monitors -j | jq -r --arg m "$MON" '.[] | select(.name==$m) | .activeWorkspace.id')

focus "monitor = \"$MON\""
sleep 0.4
focus "workspace = \"$WS\""
sleep 0.8

declare -A NAME=( [1]=part1-footprinting [2]=part2-scanning [3]=part3-enumeration )

for p in ${PARTS:-1 2 3}; do
  rm -f "$TMP/done$p"
  foot -m -H -a cehlab -T "Activity 1 - part $p" -D "$PWD" \
       bash -c "PART=$p PAUSE=0 bash ./activity1.sh; touch $TMP/done$p" &
  pid=$!
  for _ in $(seq 1 60); do [ -f "$TMP/done$p" ] && break; sleep 0.5; done
  sleep 2
  grim -o "$MON" "$SHOT/${NAME[$p]}.png"
  kill "$pid" 2>/dev/null
  sleep 0.8
done

focus "workspace = \"$OLDWS\""
focus "monitor = \"$OLDMON\""
echo "saved: $(ls -1 $SHOT/part*.png | tr '\n' ' ')"
