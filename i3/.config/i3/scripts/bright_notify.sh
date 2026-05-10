#!/bin/sh

notify-send -u low -t 1500 "Brightness - $(brightnessctl -m i | cut -d ',' -f 4)"
