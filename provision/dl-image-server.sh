#!/bin/bash

###########################################################
# This script is used to provision the following servers: #
#                                                         #
# t-w-image01.library.ucla.edu                            #
# p-w-image01.library.ucla.edu                            #
#                                                         #
###########################################################

# Defined playbook variables
HOST='$1'
LIMIT="$2"

# Set ansible-playbook strap
source ansiblestrap.sh

# Create DLP users
echo "$PLAYBOOKCMD plays/uclalib_dlp_users.yml -v --vault-password-file $VAULTPASSWORD"

# Provision Jiiify framework
echo "$PLAYBOOKCMD plays/iiifimage.yml -v --vault-password-file $VAULTPASSWORD"
