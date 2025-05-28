#!/bin/bash

# Directory containing wallpapers (change this to your wallpaper directory)
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Get a list of files in the wallpaper directory
wallpapers=("$WALLPAPER_DIR"/*)

# Get the number of wallpapers available
num_wallpapers=${#wallpapers[@]}

# Exit if no wallpapers found
if [ "$num_wallpapers" -eq 0 ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Generate a random index between 0 and num_wallpapers-1
random_index=$((RANDOM % num_wallpapers))

# Select the wallpaper at the random index
selected_wallpaper="${wallpapers[$random_index]}"

# Set the wallpaper using feh
feh --bg-scale "$selected_wallpaper"

echo "Wallpaper set to: $selected_wallpaper"

