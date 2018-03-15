#! /usr/bin/bash

[[ $(pamixer --get-mute) = true ]] && MUTE="🔇" || MUTE="🔊"
VOL="$MUTE $(pamixer --get-volume)"
LOCALTIME=`date '+%Z=%a %Y-%m-%d %H:%M'`
OTHERTIME=`TZ=Europe/Berlin date +%Z\=%H:%M`

LINKS=`ip l | grep 'state UP' | awk '{print $2}' | sed 's/.$//'`    # get all active links
IPS=$(for link in $LINKS; {                                         # iterate over all active links
    echo -n $link: $(                                               # print link name
    for l in `ip a show dev $link`; { echo $l; } |                  # get address of link
    grep -Pe '^inet$' -A1 | tail -n1) " "; })                       # filter for IPv4 address

echo " $IPS | $VOL | $OTHERTIME | $LOCALTIME "
