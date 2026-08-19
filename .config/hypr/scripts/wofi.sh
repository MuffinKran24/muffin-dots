#!/usr/bin/env bash

if pgrep -f "wofi --show drun" > /dev/null; then
    pkill wofi
    wofi --show run &
elif pgrep -f "wofi --show run" > /dev/null; then
    pkill wofi
    wofi --show drun &
else
    pkill wofi
    wofi --show drun &
fi
