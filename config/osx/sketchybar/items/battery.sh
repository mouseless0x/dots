#!/bin/bash

sketchybar --add item battery right \
    --set battery update_freq=120 \
                  icon.padding_right=0 \
                  icon.font="BerkeleyMono Nerd Font Mono:Bold:14.0" \
                  script="$PLUGIN_DIR/battery.sh" \
    --subscribe battery system_woke power_source_change
