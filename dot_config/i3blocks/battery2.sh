#!/usr/bin/env bash
# ~/.config/i3blocks/battery   (oder wo du es hast)

# Mehrere BAT* abfangen (z. B. BAT0, BAT1, ...)
BAT_PATH=$(ls /sys/class/power_supply/BAT*/capacity 2>/dev/null | head -n1)
if [ -z "$BAT_PATH" ]; then
    echo "No battery"
    echo "No bat"
    exit 0
fi

DIR=$(dirname "$BAT_PATH")

capacity=$(cat "$DIR/capacity" 2>/dev/null || echo 100)
status=$(cat "$DIR/status"    2>/dev/null || echo "UNK")

# Catppuccin Farben (angepasst)
RED="#f28fad"     # low / critical
YELLOW="#fae3b0"  # medium / warn
GREEN="#abe9b3"   # good
WHITE="#ffffff"   # charging / full
GRAY="#c9cbff"    # discharging neutral

# Icons (Nerd Fonts / Font Awesome empfohlen)
ICON_CHARGING=""      # fa-bolt / lightning (Nerd: f0e7)
ICON_FULL=""         # fa-battery-full
ICON_GOOD=""         # fa-battery-3/4
ICON_MEDIUM=""       # fa-battery-1/2
ICON_LOW=""          # fa-battery-1/4
ICON_CRITICAL=""     # fa-battery-empty
ICON_DISCHARGING=""  # Default bei Discharging

if [ "$status" = "Charging" ] || [ "$status" = "Full" ]; then
    icon="$ICON_CHARGING"
    color="$WHITE"
    # Optional: Bei Full anderes Icon
    [ "$status" = "Full" ] && icon="" && color="$GREEN"  # Stecker-Icon
elif [ "$status" = "Discharging" ] || [ "$status" = "UNK" ]; then
    if [ "$capacity" -le 10 ]; then
        icon="$ICON_CRITICAL"
        color="$RED"
    elif [ "$capacity" -le 25 ]; then
        icon="$ICON_LOW"
        color="$RED"
    elif [ "$capacity" -le 50 ]; then
        icon="$ICON_MEDIUM"
        color="$YELLOW"
    elif [ "$capacity" -le 80 ]; then
        icon="$ICON_GOOD"
        color="$GREEN"
    else
        icon="$ICON_FULL"
        color="$GREEN"
    fi
else
    icon=""           # unknown
    color="$GRAY"
fi

# Vollständige Zeile (lange Text)
echo "<span color='$color'>$icon $capacity%</span>"

# Kurze Zeile (wird oft in i3blocks als short_text genutzt)
echo "$capacity%"
