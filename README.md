
Ansible bug demo
================

First type the commands below :

    user@host$ vagrant up
    user@host$ vagrant ssh
    vagrant@vagrant$ sudo su

Then run ansible playbook once :

    root@vavrant# ./local.sh 
    [...]
    TASK [Fetch YouCompleteMe plugin for vim] **************************************
    changed: [localhost]

    PLAY RECAP *********************************************************************
    localhost                  : ok=2    changed=1    unreachable=0    failed=0   


Then a second time : 

    root@vavrant# ./local.sh 
    [...]
    TASK [Fetch YouCompleteMe plugin for vim] **************************************
    fatal: [localhost]: FAILED! => {"changed": false, "failed": true, "msg": "Unable to parse submodule hash line: Entrée dans 'third_party/requests'"}

    PLAY RECAP *********************************************************************
    localhost                  : ok=1    changed=0    unreachable=0    failed=1 

Yeah! It failed this time! ;-)

