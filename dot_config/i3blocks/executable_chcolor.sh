#!/usr/bin/env zsh
# c-color.sh – toggles statusbar color in i3blocks config

CONFIG="$HOME/.config/i3blocks/config"

# Farben definieren
COLOR1="#74c7ec"
COLOR2="#ff2222"

# Prüfen, welche Farbe gerade drin ist
if grep -q "$COLOR1" "$CONFIG"; then
    sed -i "s/$COLOR1/$COLOR2/g" "$CONFIG"
    echo "Replaced blue ($COLOR1) with red ($COLOR2)"
elif grep -q "$COLOR2" "$CONFIG"; then
    sed -i "s/$COLOR2/$COLOR1/g" "$CONFIG"
    echo "Replaced red ($COLOR2) with blue ($COLOR1)"
else
    # Keine der Farben gefunden – setze default
    echo "Neither $COLOR1 nor $COLOR2 found in config. Adding $COLOR1."
    sed -i "1i$COLOR1" "$CONFIG"
fi

# i3 neu starten – absoluter Pfad
/usr/bin/i3-msg restart
