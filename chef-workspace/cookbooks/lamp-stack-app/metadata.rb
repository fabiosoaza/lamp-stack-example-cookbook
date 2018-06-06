name 'lamp-stack-app'
maintainer 'Fabio Souza'
maintainer_email 'you@example.com'
license 'MIT'
description 'Installs/Configures lamp-stack-app'
long_description 'Installs/Configures lamp-stack-app'
version '1.0.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'lamp-stack-apache'
depends 'lamp-stack-haproxy'
depends 'lamp-stack-mysql'

