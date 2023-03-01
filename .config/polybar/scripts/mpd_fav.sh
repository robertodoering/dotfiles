#!/bin/sh

# Polybar script to favorite / unfavorite a currently playing song.

# TODO:
# - cleanup
# - check if playlist exists
# - check if current song exists (player not stopped)


playlist=$HOME/.config/mpd/playlists/fav.m3u


fav_state() {
  current_id=$(mpc status | grep -E "^\[playing\]|\[paused\]" | awk '{print $2}' | awk -F "/" '{print $1}' | cut -c 2-)
  current_id=$(expr $current_id - 1)

  current_song=$(grep "^$current_id:" $HOME/.config/mpd/state | awk -F ":" '{print $2}')

  if (grep -Fw "$current_song" $playlist -q) ; then
    return 0
  else
    return 1
  fi
}


fav() {
  current_id=$(mpc status | grep -E "^\[playing\]|\[paused\]" | awk '{print $2}' | awk -F "/" '{print $1}' | cut -c 2-)
  current_id=$(expr $current_id - 1)

  current_song=$(grep "^$current_id:" $HOME/.config/mpd/state | awk -F ":" '{print $2}')

  echo $current_song >> $playlist
}


unfav() {
  current_id=$(mpc status | grep -E "^\[playing\]|\[paused\]" | awk '{print $2}' | awk -F "/" '{print $1}' | cut -c 2-)
  current_id=$(expr $current_id - 1)

  current_song=$(grep "^$current_id:" $HOME/.config/mpd/state | awk -F ":" '{print $2}')

  grep -Fwv "$current_song" $playlist > /tmp/mpd_fav.m3u
  cp -f /tmp/uwu.m3u $playlist
}


toggle() {
  if fav_state; then
    unfav
  else
    fav
  fi
}


trap "toggle" USR1


while true
do
  if fav_state ; then
    echo "  "
  else
    echo "  "
  fi

  mpc current --wait > /dev/null &
  wait
done
