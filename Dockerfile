FROM debian:jessie
MAINTAINER Glenn Y. Rolland <glenux@glenux.net>

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y git locales python-yaml python-jinja2 git

# Configure locales

RUN sed -i -e 's/# fr_FR/fr_FR/' /etc/locale.gen && locale-gen
RUN echo "LANG=fr_FR.UTF-8" > /etc/default/locale
RUN echo "LC_ALL=\"fr_FR.UTF-8\"" >> /etc/default/locale

# Enable french locales (for the bug demo)

ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr  
ENV LC_ALL fr_FR.UTF-8  

# Install ansible from Git

RUN git clone http://github.com/ansible/ansible.git /usr/local/ansible
WORKDIR /usr/local/ansible
RUN git submodule update --init --recursive
ENV PATH /usr/local/ansible/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV ANSIBLE_LIBRARY /usr/local/ansible/library
ENV PYTHONPATH /usr/local/ansible/lib:$PYTHON_PATH

# Add demo playbook

ADD . /root/demo-playbook

# Start !

WORKDIR /root/demo-playbook
CMD /bin/bash

