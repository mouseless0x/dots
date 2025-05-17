#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)

# Check if mullvad process is running
MULLVAD_RUNNING=$(pgrep -x "mullvad-daemon" || pgrep -x "mullvad-vpn")

# Check if tunnel interface is active AND mullvad is running
MULLVAD_VPN=$(ifconfig | grep -E '^utun[0-9]+:' | while read interface; do
    interface_name=$(echo "$interface" | cut -d':' -f1)
    if ifconfig "$interface_name" | grep -q 'inet '; then
        echo "active"
        break
    fi
done)

if [[ $MULLVAD_RUNNING != "" && $MULLVAD_VPN != "" ]]; then
    ICON=""
    LABEL="VPN"
elif [[ $IP_ADDRESS != "" ]]; then
    ICON=""
    LABEL=$IP_ADDRESS
else
    ICON=""
    LABEL="Not Connected"
fi

sketchybar --set $NAME icon=$ICON \
    label="$LABEL"