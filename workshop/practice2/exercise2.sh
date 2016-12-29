#! /bin/zsh


# Write a shell script that accepts a file or directory name as an argument.  Have the script report
# if it is a regular file, a directory, or other type of file.  If it is a regular file, exit with a 0 exit status.
# If it is a directory, exit with a 1 exit status.  If it is some other type of file, exit with a 2 exit status.
EXIT_STATUS="4"
for USER_ENTRY in $@
do

  if [[ -f $USER_ENTRY ]]; then
    echo "$USER_ENTRY is a regular file"
    EXIT_STATUS="0"
  elif [[ -d $USER_ENTRY ]]; then
    echo "$USER_ENTRY is a directory"
    EXIT_STATUS="1"
  elif [[ -e $USER_ENTRY ]]; then
    echo "$USER_ENTRY is other type of file"
    EXIT_STATUS="2"
  else
    echo "$USER_ENTRY does not exist"
    EXIT_STATUS="3"
  fi

  # ls -al ${USER_ENTRY}
  echo "-------------------------------------------"

done

echo ${EXIT_STATUS}
exit ${EXIT_STATUS}
