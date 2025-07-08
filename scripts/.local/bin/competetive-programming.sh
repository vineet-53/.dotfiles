#!/bin/bash

if [[ -d "$HOME/programming/" ]];then 
  cd "/mnt/d/codes/cp/a_codes/"
elif [[ -d "/mnt/d/codes/cp/" ]];then 
  cd "$HOME/programming/"
fi 


SESSION_NAME="competetive-programming"

function create_new_session() { 
    tmux new-session -d -s $SESSION_NAME
    tmux rename-window $SESSION_NAME
    tmux send-keys -t 0 "nvim a.cpp" C-m
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
