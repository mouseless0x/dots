#!/bin/sh

# Get current label visibility state
CURRENT_STATE=$(sketchybar --query ip_address | jq -r '.label.drawing')

if [ "$CURRENT_STATE" = "on" ]; then
    sketchybar --set ip_address label.drawing=off
else
    sketchybar --set ip_address label.drawing=on
fi