#!/usr/bin/env bash
set -e
url='https://raw.githubusercontent.com/flavio-fernandes/puppet-bootstrap/master/ubuntu.sh'

wget -O ./bootstrap.sh ${url}

chmod 755 ./bootstrap.sh

cat <<EOT >> ./bootstrap.sh

# Installing Puppet Modules
puppet module install puppetlabs/vcsrepo
puppet module install puppetlabs/stdlib
EOT
