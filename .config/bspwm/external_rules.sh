#!/bin/bash

wid=$1
group=$2
title=$(xtitle "$wid")


# android emulator
[[ "$title" == 'Emulator'* ]] \
    && echo state=floating

[[ "$group" == 'Steam' ]] \
    && echo state=floating