#!/bin/sh

# called in .xinitrc to setup screenlayout

xrandr \
    --output HDMI-0 --mode 1920x1080 --primary --pos 0x1080 --rate 144 --rotate normal \
    --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --pos -1080x718 --rotate left \
    --output DP-1 --mode 1920x1080 --same-as DP-2 --rotate normal
