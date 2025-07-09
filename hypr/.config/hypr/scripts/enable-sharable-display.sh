#!/bin/bash

echo "
monitor = eDP-1, 1920x1080@120.00,0x0,1
# 1920x0 means on the right of eDP-1
monitor=HDMI-A-1,1920x1080@120.00,1920x0,1
" > $HOME/.config/hypr/monitors.conf
sed 's/output.*/output=HDMI-A-1/g' "$HOME/.config/hypr/devices.conf"
sleep 0.5
hyprctl reload


