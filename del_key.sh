#! /bin/bash

HOSTLIST="./hosts.txt"

for host in $(cat $HOSTLIST)

do
ssh username@$host 'rm -f ~/.ssh/authorized_keys'
    if [ $? -ne 0 ]; then

        echo "$host authorized key delete failed" 

        else

        echo "$host authorized key deleted"

    fi

done
