#!/bin/bash

# concat the file details from enable-hdmi disable-edp

cat <(cat "$HOME/.config/hypr/monitor_profiles/hdmi-enable.conf" "$HOME/.config/hypr/monitor_profiles/edp-disable.conf") > $HOME/.config/hypr/monitors.conf
hyprctl reload
