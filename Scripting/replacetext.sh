#!/bin/bash



old_text="$1"

new_text="$2"

directory="$3"



if [[ ! -d "$directory" ]]; then

  echo "Directory $directory does not exist."

  exit 1

fi



# Escape forward slashes and ampersands in old_text and new_text to avoid sed errors

escaped_old=$(printf '%s\n' "$old_text" | sed 's/[\/&]/\\&/g')

escaped_new=$(printf '%s\n' "$new_text" | sed 's/[\/&]/\\&/g')



find "$directory" -type f -exec sed -i "s/${escaped_old}/${escaped_new}/g" {} +



echo "Replaced \"$old_text\" with \"$new_text\" in all files under $directory"

 
