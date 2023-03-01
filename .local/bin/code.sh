#!/bin/zsh

dir="$HOME/data/dev"

if [ ! -z "$1" ] ; then
  project=$1
else
  project=$(echo "home\nnvim\nbin\n$(ls "$dir")" | rofi -dmenu -i -p "code")
fi

[ -z "$project" ] && exit 0

case $project in
  # "home") cd $HOME && neovide --multigrid && exit 0 ;;
  "home") codium $HOME && exit 0 ;;
  "nvim") cd $HOME/.config/nvim && neovide --multigrid && exit 0 ;;
  "bin") cd $HOME/.local/bin && neovide --multigrid && exit 0 ;;
  "cut") toggle_flutter.sh master ;;
  "superlist") toggle_flutter.sh superlist ;;
  "harpy") codium "$dir/$project" && exit 0 ;;
  *) toggle_flutter.sh stable ;;
esac

# cd "$dir/$project" && neovide --multigrid
codium "$dir/$project"
