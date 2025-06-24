#!/bin/sh
path='/mnt/drive2/obsidian-notes'
folder='/mnt/drive2/obsidian-notes/01_Tasks'
formatted_file_name=$(date '+%B-%Y').md
cd "${path}" || exit
touch "${folder}/${formatted_file_name}"
nvim "${folder}/${formatted_file_name}"
