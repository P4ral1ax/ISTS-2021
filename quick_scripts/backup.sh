#!/bin/bash

###########################
## Must run as superuser ##
###########################
if [ "$EUID" -ne 0 ]
  then echo "Must run as superuser"
  exit
fi


# Check if Dir Exists
# Tar File and save to special DIR
# Go through Array

# Need DIRs
# SSH, nginx, apache, website, MariaDB, PostgreSQL, Alpine Load

