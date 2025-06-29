#!/bin/bash
cat <(cat "$HOME/.config/hypr/monitor_profiles/extended.conf" "$HOME/.config/hypr/monitor_profiles/workspace-rules.conf") > $HOME/.config/hypr/monitors.conf
sed 's/output.*/output=HDMI-A-1/g' devices.conf
hyprctl reload


