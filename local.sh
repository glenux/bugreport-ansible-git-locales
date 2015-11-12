#!/bin/sh

export PATH="/usr/local/ansible/bin:$PATH" 
export ANSIBLE_LIBRARY=/usr/local/ansible/library
export PYTHONPATH=/usr/local/ansible/lib

ansible-playbook -i inventory -c local local.yml 

