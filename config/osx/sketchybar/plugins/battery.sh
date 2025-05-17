#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

# Use text instead of icon
if [[ "$CHARGING" != "" ]]; then
  TEXT="CHG"
else
  TEXT="BAT"
fi

# Update with text label
sketchybar --set "$NAME" icon="$TEXT" label="${PERCENTAGE}%"
