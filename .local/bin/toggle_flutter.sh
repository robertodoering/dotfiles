#!/bin/zsh

stable() {
  rm "$HOME/.local/share/flutter"
  ln -s "$HOME/.local/share/flutter_stable" "$HOME/.local/share/flutter"
}

master() {
  rm "$HOME/.local/share/flutter"
  ln -s "$HOME/.local/share/flutter_master" "$HOME/.local/share/flutter"
}

superlist() {
  rm "$HOME/.local/share/flutter"
  ln -s "$HOME/data/dev/superlist/.flutter/" "$HOME/.local/share/flutter"
}

# use the first argument as a choice if one is present
# otherwise select one manually
if [ ! -z "$1" ] ; then
  choice=$1
else
  choices="stable\nmaster\nsuperlist"
  choice=$(echo "$choices" | rofi -dmenu -i -p "flutter version")
fi

[ -z "$choice" ] && return 0


case $choice in
  "stable") stable ;;
  "master") master ;;
  "superlist") superlist ;;
  *) notify-send "invalid version: '$choice'" ;;
esac
