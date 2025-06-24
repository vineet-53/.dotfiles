#!/bin/bash

# URL="https://earthshakira.github.io/a2oj-clientside/server/Ladders.html"
# xdg-open "$URL"
# URL="https://takeuforward.org/interviews/strivers-sde-sheet-top-coding-interview-problems/"
# xdg-open "$URL"
# URL="https://www.tle-eliminators.com/cp-sheet"
# URL="https://takeuforward.org/strivers-a2z-dsa-course/strivers-a2z-dsa-course-sheet-2"
# xdg-open "$URL"

cd /mnt/d/codes/cp/

SESSION_NAME="cp"

function create_new_session() { 
    tmux new-session -d -s $SESSION_NAME
    tmux rename-window $SESSION_NAME
    tmux send-keys -t 0 "nvim main.cpp" C-m
    tmux select-pane -t 0
    tmux attach-session -t $SESSION_NAME
}

function attach_to_running_session() { 
  tmux attach-session -t $SESSION_NAME
}

if tmux has-session -t $SESSION_NAME 2>/dev/null; then
  attach_to_running_session
else
  create_new_session
fi
