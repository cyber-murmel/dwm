#! /usr/bin/bash

[[ $(pamixer --get-mute) = true ]] && MUTE="🔇" || MUTE="🔊"
LOCALTIME=`date '+%Z=%a %Y-%m-%d %H:%M'`
OTHERTIME=`TZ=Europe/Berlin date +%Z\=%H:%M`
BAT="BAT $(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)";
IP=`ip r | grep kernel | awk '{match($1, /\/[0-9]*/); printf "%s: %s%s ", $3, $NF, substr($1, RSTART, RLENGTH)}'`

echo " $IP| $BAT| $OTHERTIME | $LOCALTIME "

