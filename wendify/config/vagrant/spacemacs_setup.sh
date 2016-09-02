#!/usr/bin/env bash

echo "=== Begin Spacemacs Provisioning using 'config/vagrant/spacemacs_custom_setup.sh'"

# Install spacemacs if not available
if [ ! -f ~/.spacemacs ]; then
    mv ~/.emacs.d ~/.emacs.backup
    git clone --recursive https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
    cd ~/.emacs.d
    git pull -r
    git checkout origin/develop
    #wget -O ~/.spacemacs https://raw.githubusercontent.com/wende/dotfiles/master/.spacemacs_new
fi

echo "=== End Spacemacs Provisioning using 'config/vagrant/spacemacs_custom_setup.sh'"
