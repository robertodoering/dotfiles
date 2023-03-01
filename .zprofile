emulate sh -c 'source /etc/profile'

export ZDOTDIR="$HOME/.config/zsh"

# path
path+=($HOME/.local/bin)
path+=($HOME/.local/share/gem/ruby/3.0.0/bin)
path+=($HOME/.local/share/flutter/bin)
path+=($HOME/.pub-cache/bin)
path+=($HOME/.local/share/android/cmdline-tools/latest/bin)
path+=($HOME/.local/share/android/emulator)
path+=($HOME/.local/share/android/platform-tools)

# run startx on login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx &> /dev/null
fi
