#!/bin/bash

# concat the file details from enable-hdmi disable-edp

echo "
monitor=HDMI-A-1,1920x1080@120.00,0x0,1 
monitor=eDP-1,disable
" > $HOME/.config/hypr/monitors.conf
sed 's/output.*/output=HDMI-A-1/g'  "$HOME/.config/hypr/devices.conf"
sleep 0.5
hyprctl reload

