#!/usr/bin/env bash

RED="#f28fad"
YELLOW="#f9e2af"
GREEN="#abe9b3"

HW=$(rfkill list wlan | grep "Hard blocked" | awk '{print $3}')
SW=$(nmcli -t -f WIFI g)

if [ "$HW" = "yes" ]; then
    icon=""  # roter Kreis
    echo "<span color='$RED'>$icon WLAN (Fn OFF)</span>"
elif [ "$SW" = "disabled" ]; then
    icon=""  # gelber Kreis
    echo "<span color='$YELLOW'>$icon WLAN (off)</span>"
else
    SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes' | cut -d: -f2)
    icon=""  # grüner Kreis
    echo "<span color='$GREEN'>$icon WLAN $SSID</span>"
fi

