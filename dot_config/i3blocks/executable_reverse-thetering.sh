#!/usr/bin/env bash

# gnirehtet Status + ADB-Verbindung prüfen

if ! command -v adb >/dev/null 2>&1; then
    echo "ADB fehlt"
    exit 33
fi

# Prüfen, ob mindestens ein Gerät autorisiert ist
if adb devices | grep -q "device$"; then
    # Optional: Prüfen, ob gnirehtet gerade läuft (Port 31416 wird von gnirehtet genutzt)
    if ss -ltn | grep -q ":31416"; then
        # Läuft aktiv → grün + Icon
        echo "<span color='#abe9b3'> USB</span>"   #  = USB-Icon (Nerd Font)
        echo "USB"
        exit 0
    else
        # Gerät da, aber gnirehtet nicht aktiv → gelb Warnung
        echo "<span color='#fae3b0'> connected</span>"
        echo "USB conn"
        exit 0
    fi
else
    # Kein Gerät → grau/rot
    echo "<span color='#f28fad'> off</span>"
    echo "USB off"
    exit 0
fi
