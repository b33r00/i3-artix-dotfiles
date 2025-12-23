#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT1"
STATUS=$(cat "$BAT_PATH/status")
PERCENT=$(cat "$BAT_PATH/capacity")  # csak szám, nincs %

# Szín logika
if [ "$STATUS" = "Charging" ]; then
    COLOR="#00ff00"  # zöld töltés közben
elif [ "$PERCENT" -le 20 ]; then
    COLOR="#ff0000"  # piros, ha kevés az aksi
else
    COLOR="#ddd1ab"  # krém
fi

# Ikon logika
if [ "$PERCENT" -ge 80 ]; then
    ICON=""
elif [ "$PERCENT" -ge 60 ]; then
    ICON=""
elif [ "$PERCENT" -ge 40 ]; then
    ICON=""
elif [ "$PERCENT" -ge 20 ]; then
    ICON=""
else
    ICON=""
fi

# Kiírás százalékjel nélkül
echo "%{F$COLOR}$ICON $PERCENT%{F-}"
