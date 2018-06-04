name 'lamp-stack-mysql'
description 'Mysql cookbook'
version '0.1.0'
maintainer 'Fabio Souza.'

chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'mysql', '~> 8.0'
depends 'database', '~> 6.1'
depends 'mysql2_chef_gem', '~> 2.0'

