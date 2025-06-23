#!/bin/bash
cat <(cat "$HOME/.config/hypr/monitor_profiles/extended.conf") > $HOME/.config/hypr/monitors.conf
hyprctl reload

