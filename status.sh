#! /usr/bin/bash

[[ $(pamixer --get-mute) = true ]] && MUTE="🔇" || MUTE="🔊"
VOL="$MUTE $(pamixer --get-volume)"
LOCALTIME=`date '+%Z=%a %Y-%m-%d %H:%M'`
OTHERTIME=`TZ=Europe/Berlin date +%Z\=%H:%M`
IP=`ip r | grep kernel | awk '{match($1, /\/[0-9]*/); printf "%s: %s%s", $3, $NF, substr($1, RSTART, RLENGTH)}'`

echo " $IP | $VOL | $OTHERTIME | $LOCALTIME "
