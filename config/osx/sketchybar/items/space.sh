#!/bin/bash

SPACE_ICONS=("1 " "2" "3" "4" "5")

for i in "${!SPACE_ICONS[@]}"
do
    sid="$(($i+1))"
    space=(
        space="$sid"
        icon="${SPACE_ICONS[i]}"
        icon.padding_left=10
        icon.padding_right=10
        icon.y_offset=1
        label.drawing=off
        script="$PLUGIN_DIR/space.sh"
        click_script="yabai -m space --focus $sid"
    )
    sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
done
