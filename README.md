
Ansible bug demo
================

First type the commands below :

    $ vagrant up
    $ vagrant ssh
    $ sudo su

Then run ansible playbook once :

    # ./local.sh 
    [...]

Then a second time : 

    # ./local.sh 

It should fail this time ;-)

