#!/bin/sh

#
# Configure locales
#

set -e
set -x

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y locales gettext gettext-base \
	python-yaml python-jinja2 git vim

#
# Add fake git to dump env (if needed)
#
BASE=/vagrant
cp $BASE/git.sh /usr/bin/git.fake
chmod 755 /usr/bin/git.fake
if [ ! -f /usr/bin/git.real ]; then
	mv /usr/bin/git /usr/bin/git.real
	ln -s /usr/bin/git.fake /usr/bin/git
fi


# Default  locales  first
cat >  /etc/default/locale << MARK
LANG=fr_FR.UTF-8
LC_ALL=fr_FR.UTF-8
LANGUAGE=fr_FR:fr
MARK
sed -i -e 's/# fr_FR/fr_FR/' /etc/locale.gen 
locale-gen


#
# Install ansible from Git
#
git clone http://github.com/ansible/ansible.git /usr/local/ansible
cd /usr/local/ansible
git submodule update --init --recursive

#
# Prepare .bash_profile
#
cat > /root/.bash_profile << MARK
export LANG="fr_FR.UTF-8" 
export LC_ALL="fr_FR.UTF-8" 
export LANGUAGE="fr_FR:fr"
MARK

