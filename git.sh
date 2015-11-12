#!/bin/sh

set >> /var/log/git.log

exec /usr/bin/git.real $@

