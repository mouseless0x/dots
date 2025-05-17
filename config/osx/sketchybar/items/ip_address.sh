#!/bin/sh

sketchybar --add item  ip_address right                              \
           --set       ip_address script="$PLUGIN_DIR/ip_addresses.sh" \
                                  update_freq=30                     \
                                  padding_left=5                     \
                                  padding_right=5                    \
           --subscribe ip_address wifi_change