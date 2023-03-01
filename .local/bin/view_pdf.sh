#!/bin/sh

dir="$HOME/Downloads/pdfs"

pdf=$(ls "$dir" | rofi -dmenu -i -p "pdfs")

[ ! -z "$pdf" ] && zathura "$dir/$pdf"
