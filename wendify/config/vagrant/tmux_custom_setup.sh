#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/tmux_custom_setup.sh'"

# Install Git if not available
if [ ! -f /home/vagrant/.tmux.conf ]; then
    sudo apt-get install -y tmux
    echo "===== Installing Custom Tmux Config"
    cd /home/vagrant/
    wget https://raw.githubusercontent.com/wende/dotfiles/master/tmux/.zenburn.conf
    wget https://raw.githubusercontent.com/wende/dotfiles/master/tmux/.tmux.conf
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/tmux_custom_setup.sh'"
