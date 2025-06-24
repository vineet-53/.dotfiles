#!/bin/bash
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(find /mnt/d/codes -type d -not -path '*/node_modules/*' -not -path '*/node_modules' -not -path '*/.git/*' -not -path '*/.git' | fzf)
  # selected=$(find ~/Codes ~/Documents/Obsidian-Notes -type d | fzf )
fi
if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
  exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

tmux attach-session -t $selected_name -c $selected
clear
