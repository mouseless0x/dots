#!/bin/bash

sketchybar --add item ram right \
    --set ram update_freq=10 \
              icon.padding_right=0 \
              icon.font="BerkeleyMono Nerd Font Mono:Bold:14.0" \
              script="$PLUGIN_DIR/ram.sh"