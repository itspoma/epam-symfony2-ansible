#!/usr/bin/env bash
TMP_FILE='/tmp/vagrant-setup-state.keep'

if [ ! -f ${TMP_FILE} ]; then
    echo "SETUP: started.."

    # stop firewall
    sudo service iptables stop
    sudo chkconfig iptables off

    # install php
    sudo yum install -y php

    # install the EPEL package
    sudo yum install -y epel-release

    # install ansible
    sudo yum install -y ansible

    #
    touch ${TMP_FILE}
    echo "SETUP: yew, finished!"
else
    echo "SETUP: already done."
fi