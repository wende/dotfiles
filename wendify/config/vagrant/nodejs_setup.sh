#!/usr/bin/env bash

echo "=== Begin Vagrant Provisioning using 'config/vagrant/nodejs_setup.sh'"

if [ -z `which nodejs` ]; then
    # Instructions from:
    # https://nodesource.com/blog/nodejs-v012-iojs-and-the-nodesource-linux-repositories
    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
    sudo apt-get install -y nodejs
    npm install brunch -g
fi

echo "=== End Vagrant Provisioning using 'config/vagrant/nodejs_setup.sh'"
