#!/bin/bash
  
old_text="$1"
new_text="$2"
directory="$3"

shift 2  # Remove the first two arguments, so $@ contains only files

if [[ ! -d "$directory" ]]; then

  echo "Directory $directory does not exist."

  exit 1

fi

find "$directory" -type f -exec sed -i "s/${old_text}/${new_text}/g" {} +



echo "Replaced \"$old_text\" with \"$new_text\" in all files under $directory"


#for file in "$@"; do
#
#  if [[ -f "$file" ]]; then
#
    # Use sed for in-place replacement
#
#    sed -i "s/${old_text}/${new_text}/g" "$file"
#
#    echo "Replaced text in $file"

#  else

#    echo "File $file does not exist."

#  fi

#done
