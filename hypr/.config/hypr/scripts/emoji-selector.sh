#!/bin/bash 

awk '{print tolower($0)}' $HOME/.config/hypr/scripts/emoji | rofi -dmenu | wl-copy
