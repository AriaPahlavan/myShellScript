#! /bin/bash

# Modify the previous script so that it accepts the file or directory name as an argument instead of
# prompting the user to enter it.

USER_ENTRY=$1
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
