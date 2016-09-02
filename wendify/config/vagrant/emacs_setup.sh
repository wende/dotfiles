#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/emacs_setup.sh'"

# Install Git if not available
if [ -z `which emacs` ]; then
  echo "===== Installing Emacs"
  wget http://ftp.task.gda.pl/pub/gnu/emacs/emacs-24.4.tar.gz
  tar -xvzf emacs-24.4.tar.gz
  cd emacs-24.4
  ./configure
  make
  make install
  make clean
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/emacs_setup.sh'"
