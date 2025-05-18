#!/bin/sh

sketchybar --add item  ip_address right                              \
           --set       ip_address icon.padding_right=0                      \
                                  icon.font.size=18                         \
                                  script="$PLUGIN_DIR/ip_addresses.sh"      \
                                  update_freq=30                             \
                                  click_script="$PLUGIN_DIR/toggle_ip.sh"    \
           --subscribe ip_address wifi_change
