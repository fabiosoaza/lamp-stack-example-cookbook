name 'lamp-stack-haproxy'
maintainer 'Fabio Souza'
maintainer_email 'you@example.com'
license 'MIT'
description 'Installs/Configures haproxy'
long_description 'Installs/Configures haproxy'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'haproxy', '= 3.0.4'

