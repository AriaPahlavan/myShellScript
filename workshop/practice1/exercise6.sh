#! /bin/bash

# Write a shell script that prompts the user for a name of a file or directory and reports if it is a
# regular file, a directory, or other type of file.
# Also perform an ls command against the file or directory with the long listing option.
read -p "Enter file or directory name: " USER_ENTRY

if [[ -f $USER_ENTRY ]]; then
  echo "$USER_ENTRY is a regular file"
elif [[ -d $USER_ENTRY ]]; then
  echo "$USER_ENTRY is a directory"
elif [[ -e $USER_ENTRY ]]; then
  echo "$USER_ENTRY is other type of file"
else
  echo "$USER_ENTRY does not exist"

fi
ls -al ${USER_ENTRY}
