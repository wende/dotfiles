#!/usr/bin/env bash

echo "=== Begin Gitlab Multi Runner Provisioning using 'config/vagrant/gitlab_multi_runner_setup.sh'"

# Install Git if not available
if [ -z "$GITLAB_URL" ] && [ -z "$GITLAB_TOKEN" ]; then
    echo "===== Installing GitLab MutliRunner ====="
    export GITLAB_URL="https://gitlab.com/ci"
    export GITLAB_TOKEN="PfdaZsbWzUqAdi4MorWU"
fi

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash
sudo apt-get install -y gitlab-ci-multi-runner
sudo gitlab-ci-multi-runner register -u $GITLAB_URL -r $GITLAB_TOKEN --executor shell -n --tag-list elixir,phoenix,erlang,postgresql
sudo gitlab-ci-multi-runner restart
echo "=== End Vagrant Provisioning using 'config/vagrant/gitlab_multi_runner_setup.sh'"
