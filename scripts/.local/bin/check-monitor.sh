#!/bin/bash 

# while true;do
#   is_monitor_enabled=$(xrandr | grep "HDMI-A-1" | wc -l)
#   is_laptop_enabled=$(xrandr | grep "eDP-1" | wc -l)
#
#   monitor_dpms_status=$(hyprctl monitors HDMI | grep dpms | sed 's/dpmsStatus://')
#
#   is_hdmi_present=$(hyprctl monitors all | grep "HDMI-A-1" | wc -l)
#
#   if [[ $is_hdmi_present -eq 1 && $is_laptop_enabled -eq 1 && $is_monitor_enabled -eq 0 ]];then 
#     # need to shift to hdmi 
#     $HOME/.config/hypr/scripts/enable-hdmi-only.sh
#   fi
#
#   if [[ ($is_hdmi_present -eq 0 || $monitor_dpms_status -eq 0) && $is_monitor_enabled -eq 0 && $is_laptop_enabled -eq 0 ]]; then 
#     # hdmi is not found then shift to edp display
#     $HOME/.config/hypr/scripts/enable-edp-only.sh  
#   fi
#   sleep 1
# done

monitor_hdmi="HDMI-A-1"

udevadm monitor --subsystem-match=drm --property | \
while read -r line; do
    if echo "$line" | grep -q "change"; then
        status=$(hyprctl monitors | grep "$monitor_hdmi")
        if echo "$status" | grep -q "enabled: true"; then
          $HOME/.config/hypr/scripts/enable-hdmi-only.sh  
        else
          $HOME/.config/hypr/scripts/enable-edp-only.sh  
        fi
    fi
done
