#!/bin/sh

userresources=$HOME/.config/X11/xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# setup xrandr
screenlayout_setup.sh

# clipboard setup
greenclip daemon &
autocutsel -selection PRIMARY -fork &

mouse_setup.sh &
bluetooth_init.sh &
nitrogen --restore &
#picom &
dunst &
pgrep -x mpd || mpd &
redshift -l "50.110924:8.682127" -b "1:.75" &

exec bspwm
