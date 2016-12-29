#! /bin/bash

# Write a shell script to check to see if the file "/etc/shadow" exists.  If it does exist, display
# "Shadow passwords are enabled."  Next, check to see if you can write to the file.  If you can,
# display "You have permissions to edit /etc/shadow."  If you cannot, display "You do NOT have
# permissions to edit /etc/shadow."

#1st task:
if [[ -e "/etc/shadow" ]]; then
  echo "Shadow passwords are enabled."
fi

#2nd task:
if [[ -x "/etc/shadow" ]]; then
  echo "You have permissionsto edit /etc/shadow"
else
  echo "You do NOT have permissionsto edit /etc/shadow"
fi
