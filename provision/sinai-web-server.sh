#!/bin/bash

###########################################################
# This script is used to provision the following servers: #
#                                                         #
# t-w-image01.library.ucla.edu                            #
# p-w-image01.library.ucla.edu                            #
#                                                         #
###########################################################

# Defined playbook variables
INVENTORY="$1"
LIMIT="$2"
APPENV="$3"

if [ -z $APPENV ];
then
  echo "APPENV is undefined. Please set the variable\n"
  echo "Available environments are: dl-images | test-dl-images | sinai-images | stage-sinai-images | test-sinai-images"
exit
fi

# Set ansible-playbook strap
source ansiblestrap.sh

# Create DLP users
$PLAYBOOKCMD $ANSIBLEROOT/plays/uclalib_dlp_users.yml -v --vault-password-file $VAULTPASSWORD

# Provision Jiiify framework
$PLAYBOOKCMD $ANSIBLEROOT/plays/sinai_scholars.yml -v --vault-password-file $VAULTPASSWORD -e sinai_env=$3