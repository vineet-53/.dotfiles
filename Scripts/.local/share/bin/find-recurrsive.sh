#!/bin/sh

cd $(fzf --walker=,dir,hidden --walker-root=$HOME)
