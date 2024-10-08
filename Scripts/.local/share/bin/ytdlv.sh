
dir='$HOME/Videos/Youtube/%(title)s.%(ext)s'
selected_option=$(echo -e "Paste" | rofi -dmenu -p "Select action:")
if [ "$selected_option" == "Paste" ]; then
	pasted_content=$(wl-paste)
	rofi -dmenu -p "Pasted content: $pasted_content"
	resolution=$(yt-dlp -q --list-formats "$pasted_content" | awk '{print $1 "\t" $2 "\t" $3 "\t" $4  "\t"  $6 "\t" $7 }' | rg "1920x" | rg "mp4" | rofi -dmenu -p "Select Resolution:" | awk '{print $1}')
	audio=$(yt-dlp -q --list-formats "$pasted_content" | awk '{print $1 "\t" $2 "\t" $3 "\t" $4  "\t"  $6 "\t" $7 }' | rg "m4a" | rofi -dmenu -p "Select Audio Quality:" | awk '{print $1}')
	yt-dlp -q --format $resolution+$audio -o $dir $pasted_content
	notify-send "Download Complete" "Video has been downloaded"
else
	notify-send "Download Aborted "
fi
