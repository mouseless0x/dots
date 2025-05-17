#!/bin/bash

sketchybar --add item cpu right \
    --set cpu update_freq=5 \
              icon.padding_right=0 \
              icon.font="BerkeleyMono Nerd Font Mono:Bold:14.0" \
              script="$PLUGIN_DIR/cpu.sh"