name             'avahi'
maintainer       'Paul Welch'
maintainer_email 'git@pwelch.net'
license          'Apache-2.0'
description      'Installs/Configures avahi'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

source_url 'https://github.com/pwelch/chef-avahi'
issues_url 'https://github.com/pwelch/chef-avahi/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)

%w(ubuntu debian redhat centos).each do |os|
  supports os
end

recipe 'avahi::default', 'Installs and configures avahi-daemon'
