#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/phoenix_setup.sh'"

PHOENIX_VERSION=1.0.0

# Install Git if not available
# if [ -z `which elixir` ]; then
  echo "===== Installing Phoenix"
  yes Y | mix local.hex
  yes Y | mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
# fi

echo "=== End Vagrant Provisioning using 'config/vagrant/phoenix_setup.sh'"
