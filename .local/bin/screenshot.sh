#!/bin/bash

# Creates a screenshot for a selected area and copies it to the clipboard.
# 
# Requires:
# * imagemagick
# * slop
# * xclip

slop=$(slop -o -f "%g") || exit 1
read -r G < <(echo $slop)
import -window root -crop $G /tmp/screenshot.png
xclip -selection clipboard -target image/png "/tmp/screenshot.png"
