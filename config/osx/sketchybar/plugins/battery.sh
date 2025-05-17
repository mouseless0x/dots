#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  100) ICON="􀛨"       # 100% full
  ;;
  9[0-9]) ICON="􀺸"    # 90-99%
  ;;
  8[0-9]) ICON="􀺶"    # 80-89%
  ;;
  7[0-9]) ICON="􀺴"    # 70-79%
  ;;
  6[0-9]) ICON="􀺲"    # 60-69%
  ;;
  5[0-9]) ICON="􀺰"    # 50-59%
  ;;
  4[0-9]) ICON="􀺮"    # 40-49%
  ;;
  3[0-9]) ICON="􀺬"    # 30-39%
  ;;
  2[0-9]) ICON="􀪫"    # 20-29%
  ;;
  1[0-9]) ICON="􀛩"    # 10-19%
  ;;
  *) ICON="􀛪"         # <10% critical
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
fi

# Update icon and always show percentage label
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
