#!/bin/bash
# Set the path to your wallpapers directory
# wallpapersDir="$HOME/Pictures/Wallpapers/Slideshow"
wallpapersDir="$HOME/Pictures/Wallpapers/Wallpapers/cars/"
# Get all image files in the directory
wallpapers=("$wallpapersDir"/*)

# Function to check if array is empty and refill it
check_and_refill_wallpapers() {
  if [ ${#wallpapers[@]} -eq 0 ]; then
    wallpapers=("$wallpapersDir"/*)
  fi
}

# Loop to continuously set random wallpaper
while true; do
  # Call the function to ensure wallpapers array is populated
  check_and_refill_wallpapers

  # Select a random index from the wallpapers array
  wallpaperIndex=$((RANDOM % ${#wallpapers[@]}))
  echo "index $wallpaperIndex"
  selectedWallpaper="${wallpapers[$wallpaperIndex]}"

  # Set the wallpaper using swww img
  swww img --transition-step=255 "$selectedWallpaper"
  break
  # (Optional) Add delay between wallpaper changes (modify as needed)
  # sleep 3600  # Change wallpaper every hour (comment out for continuous)
done
