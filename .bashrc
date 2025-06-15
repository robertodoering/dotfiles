#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

