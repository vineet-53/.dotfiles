#!/bin/bash

# Output directory and filename format
output_dir="$HOME/Videos/Youtube/%(title)s.%(ext)s"

pasted_content=$(rofi -dmenu -p "Paste Link:")

# Check if anything was pasted
if [ -z "$pasted_content" ]; then
    notify-send "No URL found in clipboard"
    exit 1
fi

# List available video formats
resolution=$(yt-dlp -q --list-formats "$pasted_content" |
    awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $6 "\t" $7}' |
    rg "1920x" | rg "mp4" |
    rofi -dmenu -p "Select Video Resolution:" |
    awk '{print $1}')

# If nothing selected, abort
[ -z "$resolution" ] && notify-send "Aborted" "No video format selected" && exit 1

# List available audio formats
audio=$(yt-dlp -q --list-formats "$pasted_content" |
    awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $6 "\t" $7}' |
    rg "m4a" |
    rofi -dmenu -p "Select Audio Quality:" |
    awk '{print $1}')

# If nothing selected, abort
[ -z "$audio" ] && notify-send "Aborted" "No audio format selected" && exit 1

# Download with selected video+audio
yt-dlp -q --format "${resolution}+${audio}" -o "$output_dir" "$pasted_content"

# Notify user
notify-send "Download Complete" "Video has been downloaded"

