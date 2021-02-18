#!/bin/bash

###########################
## Must run as superuser ##
###########################

if [ "$EUID" -ne 0 ]
  then echo "Must run as superuser"
  exit
fi


# Stop Logging History 
unset HISTFILE
unset PROMPT_COMMAND
