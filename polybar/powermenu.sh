#!/bin/bash

# Power menu options
options="Reboot\nPower Off\nLogout\nCancel"

# Rofi menu
choice=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -theme ~/.config/rofi/minibox.rasi)

case "$choice" in
    "Reboot")
        loginctl reboot
        ;;
    "Power Off")
        loginctl poweroff
        ;;
    "Logout")
        pkill -KILL -u $USER
        ;;
    "Cancel")
        exit 0
        ;;
esac
