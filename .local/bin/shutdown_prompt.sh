#!/bin/zsh

choices="lock\nlogout\nreboot\nsleep\nshutdown"

case $(echo "$choices" | rofi -dmenu -i -p "bye") in
    "lock") xset -display :0 s activate ;;
    "logout") bspc quit ;;
    "reboot") reboot ;;
    "sleep") systemctl suspend ;;
    "shutdown") shutdown now ;;
esac
