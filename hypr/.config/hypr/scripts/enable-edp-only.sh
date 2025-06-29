#!/bin/bash

cat <(cat "$HOME/.config/hypr/monitor_profiles/edp-enable.conf" "$HOME/.config/hypr/monitor_profiles/hdmi-disable.conf" ) > $HOME/.config/hypr/monitors.conf
sed 's/output.*/output=eDP-1/g' $HOME/.config/hypr/devices.conf
hyprctl reload


