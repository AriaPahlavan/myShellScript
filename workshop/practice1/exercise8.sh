#! /bin/bash

# Modify the previous script to accept an unlimited number of files and directories as arguments.
for USER_ENTRY in $@
do

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
echo "-------------------------------------------"
done
