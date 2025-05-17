#!/bin/bash

sketchybar --add item front_app left \
    --set front_app icon.drawing=off label.padding_left=10 script="$PLUGIN_DIR/front_app.sh" \
    --subscribe front_app front_app_switched
