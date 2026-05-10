#!/usr/bin/env bash

card="${BACKLIGHT_CARD:-amdgpu_bl1}"
base="/sys/class/backlight/$card"
primary="#F0C674"

if [[ ! -r "$base/max_brightness" ]]; then
  echo "%{F$primary}󰃠%{F-} --%"
  exit 0
fi

max=$(<"$base/max_brightness")
# Use the requested brightness value, matching brightnessctl's percentage.
# actual_brightness can differ on amdgpu because of firmware/custom brightness curves.
value=$(<"$base/brightness")

percent=$(awk -v value="$value" -v max="$max" 'BEGIN { if (max <= 0) print 0; else printf "%d", (value * 100 / max) + 0.5 }')

if (( percent <= 30 )); then
  icon="󰃝"
elif (( percent <= 70 )); then
  icon="󰃞"
else
  icon="󰃠"
fi

printf '%%{F%s}%s %%{F-}%2d%%\n' "$primary" "$icon" "$percent"
