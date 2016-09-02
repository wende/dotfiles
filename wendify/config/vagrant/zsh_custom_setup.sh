#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/zsh_custom_setup.sh'"

# Install Git if not available
if [ -z `which zsh` ]; then
    echo "===== Installing Custom ZSH Config"
    sudo apt-get install -y zsh
    sudo chsh -s /bin/zsh vagrant
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/zsh_custom_setup.sh'"
