#!/bin/bash
cat <(cat "$HOME/.config/hypr/monitor_profiles/hdmi-enable.conf" "$HOME/.config/hypr/monitor_profiles/edp-enable.conf") > $HOME/.config/hypr/monitors.conf
hyprctl reload

