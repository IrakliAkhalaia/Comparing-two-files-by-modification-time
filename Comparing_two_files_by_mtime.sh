#!/bin/zsh

     if [ $# -ne 2 ]
     then
          echo "The number of arguments passed is less or more than allowed."
          exit
     fi

     if [ ! -e "$1" ]
     then
          echo "'$1' file doesn't exist."
          exit
     fi

     if [ ! -e "$2" ]
     then
          echo "'$2' file doesn't exist."
          exit
     fi

     FFMT=$(stat -c "%Y" "$1")
     SFMT=$(stat -c "%Y" "$2")

     if [ $FFMT -eq $SFMT ]
     then
          echo "'$1' file and '$2' file modification time are same."
     fi

     if [ "$1" -nt "$2" ]
     then
          echo "'$1' file modification time is newer than '$2' file modification time."
     else
          echo "'$1' file modification time is older than '$2' file modification time."
     fi
