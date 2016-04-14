#!/usr/bin/env bash

clear
echo -e "This script will perform the following tasks:\n
--Create ssh keys in your local home directory if they do not exist.
  (Be sure to create a passphrase for your key)
  (Do not save your key passphrase to the keychain)
--Set your search domain list for easier hostname lookups.
--Collect and provide your credential to each host in ./hosts.txt
  in order to copy your public ssh key to authorized_keys.\n"

#Give user chance to quit
read -p "Do you want to proceed? (y/n) " -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	echo -e "\nExiting without making any changes\n"
    exit
fi

echo -e "\nCreating SSH Keys...\n"

sleep 2

#Create ssh keys if they don't already exist and report outcome
[ ! -e ~/.ssh/*.pub ] && ssh-keygen -t rsa -f ~/.ssh/id_rsa

		if [ $? -ne 0 ]
                then
                echo "Did not create new keys they may already exist"
                else
                echo "SSH keys created succesfully"
        fi

read -p "Set search domains list? (y/n) " -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
        echo -e "\nSkipping setting search domains list\n"
else
echo -e "\nSetting Search Domain List. Enter local password if prompted...\n"

sleep 2

#Set search domains and report outcome       
sudo networksetup -setsearchdomains "Thunderbolt Ethernet" \
domain.example.com domain2.example.com
sudo networksetup -setsearchdomains Wi-Fi \
domain.example.com domain2.example.com

		if [ $? -ne 0 ]
                then
                echo -e "Set search domain failed.\n"
                else
                echo -e "Search domains set.\n"
        fi
fi

echo -e "Calling expect script to provide credential
for remote hosts in order to copy ssh key...\n"

sleep 2

./copykey.exp

exit 0
