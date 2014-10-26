name             'avahi'
maintainer       'Paul Welch'
maintainer_email 'paul@pwelch.net'
license          'Apache 2.0'
description      'Installs/Configures avahi'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.2'

%w{ubuntu debian}.each do |os|
  supports os
end

recipe 'avahi::default', 'Installs and configures avahi-daemon'
