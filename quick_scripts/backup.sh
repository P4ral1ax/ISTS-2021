#!/bin/bash

# Make Secret
mkdir -p /home/$1/Pictures/.../.../

all() {
  dir_array=('/etc/ssh' '/var/www' '/etc/httpd' '/etc/nginx' '/etc/mysql' '/var/lib/mysql')
  for i in "${dir_array[@]}"; do
    if [ -d "$i" ] 
    then
      tar -pcvf /home/$1/Pictures/.../.../.$i.tar.gz $i  > /dev/null  2>&1
    fi
}

one() {
  echo -ne "Enter Absolute Directory : "
  read dir
  if [ -d "$2" ] 
  then
    tar -pcvf /home/$1/Pictures/.../.../.$2.tar.gz $2  > /dev/null  2>&1
  fi

}

echo -ne "Enter Option (Default : None)\n1) All Directories\n2) Single Directory\n\n > "
read opt

# Run User Selected Mode
if [[ $opt == 1 ]]; then 
  basic
  exit 0
else
  basic
  verbose
  exit 0
fi