#!/bin/bash

if [ -z $HOST ];
then
echo "HOST is undefined. Please set the variable"
exit
fi

if [ -z $LIMIT ];
then
echo "LIMIT is undefined. Please set the variable"
exit
fi

ANSIBLEROOT="/etc/ansible"
VAULTPASSWORD="/home/ansible/ansible_key"

PLAYBOOKCMD="ansible-playbook -i $HOST -l $LIMIT"

# Create LDSE accounts
echo "$PLAYBOOKCMD plays/uclalib_ldse_users.yml -v --vault-password-file $VAULTPASSWORD"