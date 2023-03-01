#!/bin/zsh

choices="screenshot\nvideo"
choice=$(echo "$choices" | rofi -dmenu -i -p "screen capture")

[ -z "$choice" ] && return 0

video() {
  notify-send "Ctrl-Alt-s to stop recording"
  escrotum -rs
}

case $choice in
  "screenshot") screenshot.sh ;;
  "video") video ;;
esac
