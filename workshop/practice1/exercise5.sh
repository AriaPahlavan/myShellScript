#! /bin/bash

# Write a shell script that displays "man", "bear", "pig", "dog", "cat", and sheep to the screen with
# each appearing on a separate line.  Try to do this in as few lines as possible.
LIST="man bear pig dog cat sheep"

for ELEM in $LIST
do
  echo "${ELEM}"
done
