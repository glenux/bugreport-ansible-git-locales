##### Issue Type:

  - Bug Report

##### Ansible Version:

    $ ansible --version
    ansible 1.9.4
      configured module search path = None

##### Ansible Configuration:

Default debian configuration for ansible (nothing changed).

Here is the diff with the current upstream version : 

    $ diff -Nur examples/ansible.cfg /etc/ansible/ansible.cfg |sed -e 's/^/    /'
    --- examples/ansible.cfg    2015-11-11 11:23:15.701009848 +0100
    +++ /etc/ansible/ansible.cfg        2015-09-04 01:03:08.000000000 +0200
    @@ -11,18 +11,18 @@
     
     # some basic default values...
     
    -#inventory      = /etc/ansible/hosts
    +inventory      = /etc/ansible/hosts
     #library        = /usr/share/my_modules/
    -#remote_tmp     = $HOME/.ansible/tmp
    -#pattern        = *
    -#forks          = 5
    -#poll_interval  = 15
    -#sudo_user      = root
    +remote_tmp     = $HOME/.ansible/tmp
    +pattern        = *
    +forks          = 5
    +poll_interval  = 15
    +sudo_user      = root
     #ask_sudo_pass = True
     #ask_pass      = True
    -#transport      = smart
    +transport      = smart
     #remote_port    = 22
    -#module_lang    = C
    +module_lang    = C
     
     # plays will gather facts by default, which contain information about
     # the remote system.
    @@ -30,7 +30,7 @@
     # smart - gather by default, but don't regather if already gathered
     # implicit - gather by default, turn off with gather_facts: False
     # explicit - do not gather by default, must say gather_facts: True
    -#gathering = implicit
    +gathering = implicit
     
     # additional paths to search for roles in, colon separated
     #roles_path    = /etc/ansible/roles
    @@ -38,20 +38,14 @@
     # uncomment this to disable SSH key host checking
     #host_key_checking = False
     
    -# change the default callback
    -#stdout_callback = skippy
    -# enable additional callbacks
    -#callback_whitelist = timer, mail
    -
     # change this for alternative sudo implementations
    -#sudo_exe = sudo
    +sudo_exe = sudo
     
    -# What flags to pass to sudo
    -# WARNING: leaving out the defaults might create unexpected behaviours
    -#sudo_flags = -H -S -n
    +# what flags to pass to sudo
    +#sudo_flags = -H
     
     # SSH timeout
    -#timeout = 10
    +timeout = 10
     
     # default user to use for playbooks if user is not specified
     # (/usr/bin/ansible will use current user as default)
    @@ -74,11 +68,6 @@
     # this can also be set to 'merge'.
     #hash_behaviour = replace
     
    -# by default, variables from roles will be visible in the global variable
    -# scope. To prevent this, the following option can be enabled, and only
    -# tasks and handlers within the role will see the variables there
    -#private_role_vars = yes
    -
     # list any Jinja2 extensions to enable here:
     #jinja2_extensions = jinja2.ext.do,jinja2.ext.i18n
     
    @@ -86,12 +75,10 @@
     # if passing --private-key to ansible or ansible-playbook
     #private_key_file = /path/to/file
     
    -# format of string {{ ansible_managed }} available within Jinja2
    +# format of string {{ ansible_managed }} available within Jinja2 
     # templates indicates to users editing templates files will be replaced.
     # replacing {file}, {host} and {uid} and strftime codes with proper values.
    -#ansible_managed = Ansible managed: {file} modified on %Y-%m-%d %H:%M:%S by {uid} on {host}
    -# This short version is better used in templates as it won't flag the file as changed every run.
    -#ansible_managed = Ansible managed: {file} on {host}
    +ansible_managed = Ansible managed: {file} modified on %Y-%m-%d %H:%M:%S by {uid} on {host}
     
     # by default, ansible-playbook will display "Skipping [host]" if it determines a task
     # should not be run on a host.  Set this to "False" if you don't want to see these "Skipping" 
    @@ -125,13 +112,12 @@
     
     
     # set plugin path directories here, separate with colons
    -#action_plugins     = /usr/share/ansible/plugins/action
    -#callback_plugins   = /usr/share/ansible/plugins/callback
    -#connection_plugins = /usr/share/ansible/plugins/connection
    -#lookup_plugins     = /usr/share/ansible/plugins/lookup
    -#vars_plugins       = /usr/share/ansible/plugins/vars
    -#filter_plugins     = /usr/share/ansible/plugins/filter
    -#test_plugins       = /usr/share/ansible/plugins/test
    +action_plugins     = /usr/share/ansible_plugins/action_plugins
    +callback_plugins   = /usr/share/ansible_plugins/callback_plugins
    +connection_plugins = /usr/share/ansible_plugins/connection_plugins
    +lookup_plugins     = /usr/share/ansible_plugins/lookup_plugins
    +vars_plugins       = /usr/share/ansible_plugins/vars_plugins
    +filter_plugins     = /usr/share/ansible_plugins/filter_plugins
     
     # by default callbacks are not loaded for /bin/ansible, enable this if you
     # want, for example, a notification or logging callback to also apply to 
    @@ -143,52 +129,36 @@
     # set to 1 if you don't want cowsay support or export ANSIBLE_NOCOWS=1 
     #nocows = 1
     
    -# set which cowsay stencil you'd like to use by default. When set to 'random',
    -# a random stencil will be selected for each task. The selection will be filtered
    -# against the `cow_whitelist` option below.
    -#cow_selection = default
    -#cow_selection = random
    -
    -# when using the 'random' option for cowsay, stencils will be restricted to this list.
    -# it should be formatted as a comma-separated list with no spaces between names.
    -# NOTE: line continuations here are for formatting purposes only, as the INI parser
    -#       in python does not support them.
    -#cow_whitelist=bud-frogs,bunny,cheese,daemon,default,dragon,elephant-in-snake,elephant,eyes,\
    -#              hellokitty,kitty,luke-koala,meow,milk,moofasa,moose,ren,sheep,small,stegosaurus,\
    -#              stimpy,supermilker,three-eyes,turkey,turtle,tux,udder,vader-koala,vader,www
    -
     # don't like colors either?
     # set to 1 if you don't want colors, or export ANSIBLE_NOCOLOR=1
     #nocolor = 1
     
    +# the CA certificate path used for validating SSL certs. This path 
    +# should exist on the controlling node, not the target nodes
    +# common locations:
    +# RHEL/CentOS: /etc/pki/tls/certs/ca-bundle.crt
    +# Fedora     : /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem
    +# Ubuntu     : /usr/share/ca-certificates/cacert.org/cacert.org.crt
    +#ca_file_path = 
    +
    +# the http user-agent string to use when fetching urls. Some web server
    +# operators block the default urllib user agent as it is frequently used
    +# by malicious attacks/scripts, so we set it to something unique to 
    +# avoid issues.
    +#http_user_agent = ansible-agent
    +
     # if set to a persistent type (not 'memory', for example 'redis') fact values
     # from previous runs in Ansible will be stored.  This may be useful when
     # wanting to use, for example, IP information from one group of servers
     # without having to talk to them in the same playbook run to get their
     # current IP information.
    -#fact_caching = memory
    +fact_caching = memory
     
     
     # retry files
    -# When a playbook fails by default a .retry file will be created in ~/
    -# You can disable this feature by setting retry_files_enabled to False
    -# and you can change the location of the files by setting retry_files_save_path
    -
     #retry_files_enabled = False
     #retry_files_save_path = ~/.ansible-retry
     
    -
    -# prevents logging of task data, off by default
    -#no_log = False
    -
    -# prevents logging of tasks, but only on the targets, data is still logged on the master/controller
    -#no_target_syslog = True
    -
    -# controls the compression level of variables sent to
    -# worker processes. At the default of 0, no compression
    -# is used. This value must be an integer from 0 to 9.
    -#var_compression_level = 9
    -
     [privilege_escalation]
     #become=True
     #become_method=sudo
    @@ -238,19 +208,14 @@
     # (default is sftp)
     #scp_if_ssh = True
     
    -# if False, sftp will not use batch mode to transfer files. This may cause some
    -# types of file transfer failures impossible to catch however, and should
    -# only be disabled if your sftp version has problems with batch mode
    -#sftp_batch_mode = False
    -
     [accelerate]
    -#accelerate_port = 5099
    -#accelerate_timeout = 30
    -#accelerate_connect_timeout = 5.0
    +accelerate_port = 5099
    +accelerate_timeout = 30
    +accelerate_connect_timeout = 5.0
     
     # The daemon timeout is measured in minutes. This time is measured
     # from the last activity to the accelerate daemon.
    -#accelerate_daemon_timeout = 30 
    +accelerate_daemon_timeout = 30 
     
     # If set to yes, accelerate_multi_key will allow multiple
     # private keys to be uploaded to it, though each user must
    @@ -261,5 +226,5 @@
     [selinux]
     # file systems that require special treatment when dealing with security context
     # the default behaviour that copies the existing context or uses the user default
    -# needs to be changed to use the file system dependent context.
    -#special_context_filesystems=nfs,vboxsf,fuse,ramfs
    +# needs to be changed to use the file system dependant context.
    +#special_context_filesystems=nfs,vboxsf,fuse

##### Environment:

Debian stretch/sid

##### Summary:

Please summarize your request in this space.  You will earn bonus points for being succinct, but please add enough detail so we can understand the request.  Thanks!

##### Steps To Reproduce:

If this is a bug ticket, please enter the steps you use to reproduce the problem in the space below.  If this is a feature request, please enter the steps you would use to use the feature.  If an example playbook is useful, please include a short reproducer inline, indented by four spaces.  If a longer one is necessary, linking to one uploaded to gist.github.com would be great.  Much appreciated!

##### Expected Results:

Please enter your expected results in this space.  When running the steps supplied above in the previous section, what did you expect to happen?  If showing example output, please indent your output by four spaces so it will render correctly in GitHub's viewer thingy.

##### Actual Results:

Please enter your actual results in this space.  When running the steps supplied above, what actually happened?  If you are showing example output, please indent your output by four spaces so it will render correctly in GitHub.  Thanks again!
