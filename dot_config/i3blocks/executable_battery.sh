#!/usr/bin/env bash

# Beispiel: Akku-Status mit Catppuccin-Farben

capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null || echo 100)
status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null || echo "UNK")

# Catppuccin Farben
RED="#f28fad"
GREEN="#abe9b3"
WHITE="#ffffff"

if [ "$status" = "Charging" ]; then
    icon="⚡"
    color="$WHITE"
elif [ "$capacity" -le 15 ]; then
    icon=""
    color="$RED"
else
    icon=""
    color="$GREEN"
fi

echo "<span color='$color'>$icon $capacity%</span>"

# Optional: zweite Zeile = short_text
echo "$capacity%"
