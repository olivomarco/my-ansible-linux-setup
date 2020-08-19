#!/bin/bash

usage() {
    echo "USAGE: ${0} [-h] [-D] -H hostname [-p password_file]"
    echo ""
    echo "Configures the given role for the given hostname."
    echo ""
    echo "Options:"
    echo "  -h runs help (this screen)"
    echo "  -D debug mode on (more verbose output)"
    echo ""
    echo "  -H the target hostname to configure"
    echo "  -p password_file is an optional path to a password file for Ansible"
    echo ""
}

# check invocation
if (! getopts ":hDH:p:" opt); then
  usage
  exit $E_OPTERROR;
fi

debug_mode=0

# parse arguments
while getopts ":hDH:p:" opt; do
  case $opt in
    h)
      usage
      exit 1
      ;;
    D)
      debug_mode=1
      ;;
  	H)
      hostname=($OPTARG)
	  ;;
    p)
      password_file=($OPTARG)
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      usage
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

virtualenv -q -p $(which python3) venv
source venv/bin/activate

# install local requirements for ansible
ansible-galaxy install -r requirements.yml
# install additional pre-requirements
pip install jmespath dnspython

# export ansible variables
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
if [ $debug_mode -eq 0 ] ; then
  export ANSIBLE_STDOUT_CALLBACK="unixy"
else
  export ANSIBLE_STDOUT_CALLBACK="skippy"
fi

# create hosts file
echo "[prod]" > hosts
echo "${hostname}" >> hosts

# run ansible
if [ -z $password_file ] ; then
    ansible-playbook -i hosts provision.yml --vault-id @prompt
else
    ansible-playbook -i hosts provision.yml --vault-password-file $password_file
fi

deactivate
