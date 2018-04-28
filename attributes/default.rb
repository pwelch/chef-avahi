#
# Cookbook Name:: avahi
# Attribute:: default
#

default['avahi']['disable_service'] = false

case node['platform_family']
when 'rhel', 'fedora', 'amazon'
  default['avahi']['package_name'] = 'avahi'
when 'debian'
  default['avahi']['package_name'] = 'avahi-daemon'
else
  default['avahi']['package_name'] = 'avahi'
end

# avahi-daemon.conf values
default['avahi']['hostname'] = node['hostname']
default['avahi']['domain']   = 'local'
default['avahi']['useipv4']  = 'yes'
default['avahi']['useipv6']  = 'no'
