#!/bin/bash

CHEF_URL='https://omnitruck.chef.io/install.sh'
CHEF_VERSIONS=("12.9.41" "12.12.15")

for version in "${CHEF_VERSIONS[@]}"; do
  curl -Ls "${CHEF_URL}" | bash -s -- -v "${version}"
  chef-client --version
  chef-apply -e "chef_gem 'tzinfo' do; compile_time true; end; require 'tzinfo'"
done
