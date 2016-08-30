#!/bin/bash

if [ -z $INVENTORY ];
then
  echo "INVENTORY is undefined. Please set the variable"
exit
fi

if [ -z $LIMIT ];
then
  echo "LIMIT is undefined. Please set the variable"
exit
fi

if [ $INVENTORY = "vagrant.ini" ];
then
  ANSIBLE_ENV="vagrant"
elif [ $INVENTORY = "aws.ini" ];
then
  ANSIBLE_ENV="aws"
else
  ANSIBLE_ENV="vmware"
fi

ANSIBLEROOT="/etc/ansible"
VAULTPASSWORD="/home/ansible/ansible_key"

cd $ANSIBLEROOT

PLAYBOOKCMD="ansible-playbook -i $ANSIBLEROOT/$INVENTORY -l $LIMIT --output=dump -e "ansible_env=$ANSIBLE_ENV""

# Create LDSE accounts
$PLAYBOOKCMD $ANSIBLEROOT/plays/uclalib_ldse_users.yml -v --vault-password-file $VAULTPASSWORD
