#! /usr/bin/bash

[[ $(pamixer --get-mute) = true ]] && MUTE="🔇" || MUTE="🔊"
VOL=" $MUTE `pamixer --get-volume` "
LOCALTIME=" `date '+%Z=%a %Y-%m-%d %H:%M'` "
OTHERTIME=" `TZ=Asia/Hong_Kong date +%Z\=%H:%M` "
BAT=" `for BAT in /sys/class/power_supply/BAT*; do  basename $BAT; cat $BAT/capacity; done | tr '\n' ' '`"
IP=" `ip r | grep kernel | awk '{match($1, /\/[0-9]*/); printf "%s: %s%s ", $3, $NF, substr($1, RSTART, RLENGTH)}'`"
UPTIME=" `uptime | grep -Po 'load\Waverage:\W\d+\.\d+'` "
RAM=" `free | grep Mem | awk '{ printf("RAM: %5.02f%\n", $3/$2 * 100.0) }'` "

echo "$RAM|$UPTIME|$IP|$VOL|$BAT|$OTHERTIME|$LOCALTIME"
