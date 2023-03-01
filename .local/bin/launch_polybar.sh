#!/bin/sh

killall -q polybar

# wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# primary bar for the primary display
for m in $(xrandr --query | grep " connected primary" | cut -d " " -f1); do
   MONITOR=$m polybar --reload primary &
done

# non-primary displays
# for m in $(xrandr --query | grep " connected" | grep "primary" -v | cut -d " " -f1); do
#    MONITOR=$m polybar --reload secondary &
# done

# can't use all non-primary display when mirroring a display
MONITOR=DP-2 polybar --reload secondary &
MONITOR=HDMI-1 polybar --reload secondary &
