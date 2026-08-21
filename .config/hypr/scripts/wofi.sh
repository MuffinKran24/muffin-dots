#!/usr/bin/env bash

if pgrep -f "wofi --show drun" > /dev/null; then
    killall wofi
    wofi --show run &
elif pgrep -f "wofi --show run" > /dev/null; then
    killall wofi
    wofi --show drun &
else
    killall wofi
    wofi --show drun &
fi
