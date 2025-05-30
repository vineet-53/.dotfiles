#!/bin/sh
# URL="https://earthshakira.github.io/a2oj-clientside/server/Ladders.html"
# xdg-open "$URL"
# URL="https://takeuforward.org/interviews/strivers-sde-sheet-top-coding-interview-problems/"
# xdg-open "$URL"
# URL="https://www.tle-eliminators.com/cp-sheet"
# URL="https://takeuforward.org/strivers-a2z-dsa-course/strivers-a2z-dsa-course-sheet-2"
# xdg-open "$URL"

cd /mnt/d/codes/cp/
SESSION_NAME="cp"
if tmux has-session -t $SESSION_NAME 2>/dev/null; then
    tmux attach-session -t $SESSION_NAME
else
    tmux new-session -d -s $SESSION_NAME
    tmux rename-window $SESSION_NAME
    # split vertically for input
    # tmux resize-pane -R 40
    # open the files
    tmux send-keys -t 0 'nvim main.cpp' C-m
    # tmux send-keys -t 1 'nvim input.txt' C-m
    # tmux split-window -v
    # tmux send-keys -t 2 'nvim output.txt' C-m
    # select the main pane
    tmux select-pane -t 0
    # Attach to the created session
    tmux attach-session -t $SESSION_NAME
fi
