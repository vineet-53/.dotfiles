#!/bin/sh

if [ -z "$1" ]; then
  echo "Error: A file name must be set, e.g. on \"the wonderful thing about tiggers\"."
  exit 1
fi

file_name=$(echo "$1" | tr ' ' '-')
path='/mnt/drive2/obsidian-notes'
folder='/mnt/drive2/obsidian-notes/00_Inbox'
formatted_file_name=$(date "+%Y-%m-%d")_${file_name}.md
cd "${path}" || exit
touch "${folder}/${formatted_file_name}"
nvim "${folder}/${formatted_file_name}"
