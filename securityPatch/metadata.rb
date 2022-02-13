name             'securityPatch'
maintainer       'Sai Kolavennu'
license          'Apache-2.0'
description      'Check if the node is registered and patch'
long_description 'Check if the node is registered and patch'
chef_version     '>= 12.7' if respond_to?(:chef_version)
version          '0.0.1'

depends 'redhat_subscription_manager', '= 1.0.2'