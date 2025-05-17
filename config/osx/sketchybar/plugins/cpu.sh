#!/bin/sh

# Using ps to get CPU usage
CPU_PERCENT=$(top -l 2 -n 0 | grep "CPU usage" | tail -1 | awk '{print $3}' | cut -d'%' -f1)

# Round to integer
CPU_PERCENT=$(printf "%.0f" "$CPU_PERCENT")

# Use text instead of icon
sketchybar --set "$NAME" icon="CPU" label="${CPU_PERCENT}%"