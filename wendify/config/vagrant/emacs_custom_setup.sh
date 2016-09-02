#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/emacs_custom_setup.sh'"

# Install Git if not available
if [ ! -d /home/vagrant/.emacs.d ]; then
    echo "===== Installing Custom Emacs Config"
    cd /home/vagrant/
    git clone http://github.com/wende/.emacs.d
    chown vagrant .emacs.d -R
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/emacs_custom_setup.sh'"
