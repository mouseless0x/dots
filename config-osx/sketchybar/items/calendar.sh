#!/bin/bash

sketchybar --add item calendar right --set calendar \
    icon.drawing=off \
    label.padding_left=10 \
    update_freq=1 \
    script="$PLUGIN_DIR/calendar.sh"
