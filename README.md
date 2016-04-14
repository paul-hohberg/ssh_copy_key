Public Key Distribution Instructions
====================================

1) Edit the hosts.txt file to include relevant hosts if necessary.

2) Run key_deploy.sh to create new keys if they don't exist, 
   and copy them to remote hosts included in hosts.txt.

* If you already have a public ssh key in the expected location
  of your local home directory just list servers in hosts.txt 
  and run copykey.exp.

key_deploy.sh
============

This script creates ssh keys for the current user, sets the search domain list, and calls copykey.exp.

copykey.exp
===========

This expect script captures the credential for the remote hosts, and copies the users public ssh key to the remote hosts
authorized_keys.

del_key.sh
==========

This scripts deletes authorized_keys file from your home directory on servers listed in hosts.txt.

ssh-copy-id for OSX
===================

Quick port of the useful unix utility ssh-copy-id

SSH-COPY-ID(1)

NAME
ssh-copy-id - install your identity.pub in a remote machine's authorized_keys

SYNOPSIS
ssh-copy-id [-i [identity_file]] [user@]machine

DESCRIPTION
ssh-copy-id is a script that uses ssh to log into a remote machine (presumably using a login password, so password authentication should be enabled, unless
you've done some clever use of multiple identities)

It also changes the permissions of the remote user's home, ~/.ssh, and ~/.ssh/authorized_keys to remove group writability (which would otherwise prevent
you from logging in, if the remote sshd has StrictModes set in its configuration).

If the -i option is given then the identity file (defaults to ~/.ssh/identity.pub) is used, regardless of whether there are any keys in your ssh-agent.
Otherwise, if this:

ssh-add -L

provides any output, it uses that in preference to the identity file.

If the -i option is used, or the ssh-add produced no output, then it uses the contents of the identity file. Once it has one or more fingerprints (by
whatever means) it uses ssh to append them to ~/.ssh/authorized_keys on the remote machine (creating the file, and directory, if necessary)

SEE ALSO
ssh(1), ssh-agent(1), sshd(8)

