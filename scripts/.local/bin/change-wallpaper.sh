#!/bin/bash

wallpapersDir="$HOME/Pictures/wallpapers"

result=$(find "$wallpapersDir" -type f -maxdepth 1  )

wallpapers=($result)

selectedWallpaper="$wallpapersDir/$(echo "$result" |  sed 's|.*/||'  | rofi -dmenu -i)"

[[ -f "$selectedWallpaper" ]] && swww img --transition-step=255 "$selectedWallpaper"

