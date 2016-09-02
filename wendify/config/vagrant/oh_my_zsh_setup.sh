#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/zsh_custom_setup.sh'"

# Install Git if not available
if [ ! -d /home/vagrant/.oh-my-zsh ]; then
    echo "===== Installing Oh my ZSH Config"
    cd /home/vagrant/
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    rm .zshrc
    wget https://raw.githubusercontent.com/wende/dotfiles/master/zsh/.zshrc
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/zsh_custom_setup.sh'"
