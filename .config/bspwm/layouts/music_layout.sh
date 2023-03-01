#!/bin/sh

# https://www.reddit.com/r/bspwm/comments/ggtwxa/guide_to_creating_startup_layout_using_receptacles/

desktop="music"

layout() {
  bspc node @"$desktop":/ --kill

  bspc rule --add ncmpcpp   --one-shot node=@"$desktop":/1/1   border=off
  bspc rule --add btop      --one-shot node=@"$desktop":/1/2   border=off
  bspc rule --add tty-clock --one-shot node=@"$desktop":/2/1   border=off
  # bspc rule --add cava      --one-shot node=@"$desktop":/2/2/1 border=off
  # bspc rule --add Sxiv                --one-shot node=@"$desktop":/2/2/2 border=off
  bspc rule --add Sxiv                --one-shot node=@"$desktop":/2/2 border=off

  # create /1
  bspc node @"$desktop":/ -i

  # split /1 into /1/1 and /1/2
  bspc node @"$desktop":/ --presel-ratio 0.5 --presel-dir east -i

  # create /2 (below /1)
  bspc node @"$desktop":/ --presel-ratio 0.8 --presel-dir south -i

  # split /2 into /2/1 and /2/2 horizontally
  # bspc node @"$desktop":/2 -o 0.175 --presel-dir east -i
  bspc node @"$desktop":/2 -o 0.875 --presel-dir east -i

  # split /2/2 into /2/2/1 and /2/2/2 horizontall
  # bspc node @"$desktop":/2/2 -o 0.85 --presel-dir east -i

  alacritty --class ncmpcpp -e ncmpcpp &
  alacritty --class btop -e btop &
  alacritty --class tty-clock -e tty-clock -c -n -C 4 &
  # alacritty --class cava -e cava &
  kunst --size "500x500" &
}

exists() {
  bspc query --desktops --desktop "$desktop"
}

is_occupied() {
  bspc query --desktops --desktop "$desktop".occupied
}

if ! exists ; then
  notify-send -u critical "desktop $desktop doesn't exist"
else
  layout
fi
