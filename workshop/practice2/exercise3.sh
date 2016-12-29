#! /bin/zsh

# Write a script that executes the command "cat /etc/shadow".  If the command returns a 0 exit
# status report "Command succeeded" and exit with a 0 exit status.  If the command returns a
# non­zero exit status report "Command failed" and exit with a 1 exit status.
cat /etc/shadow && echo "Command succeeded" || echo "Command failed"
