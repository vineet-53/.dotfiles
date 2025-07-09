#!/bin/bash

echo "
monitor=eDP-1,1920x1080@120.00,0x0,1 
monitor=HDMI-A-1,disable
" > $HOME/.config/hypr/monitors.conf
sed 's/output.*/output=eDP-1/g' "$HOME/.config/hypr/devices.conf"
sleep 0.5
hyprctl reload


