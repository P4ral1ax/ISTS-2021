!/bin/bash

# Make Secret
mkdir /home/$1/Pictures/.../
mkdir /home/$1/Pictures/.../.../
#ssh
#Does it exist
if [ -d "/etc/ssh" ] 
then
    # Tarring add dot?
    tar -pcvf /home/$1/Pictures/.../.../.ssh.tar.gz /etc/ssh  > /dev/null  2>&1
fi
#web
if [ -d "/var/www" ]
then
    # Tarring add dot?
    tar -pcvf /home/$1/Pictures/.../.../.site.tar.gz /var/www > /dev/null 2>&1
fi
#custom
if [ -d "/etc/$2" ]
then
    # Tarring add dot?
    tar -pcvf /home/$1/Pictures/.../.../.$2.tar.gz /etc/$2  > /dev/null  2>&1
fi

history -c