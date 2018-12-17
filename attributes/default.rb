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

# rlimits config

default['avahi']['rlimit']['conf'] = true
default['avahi']['rlimit']['core'] = 0
default['avahi']['rlimit']['data'] = 4194304
default['avahi']['rlimit']['fsize'] = 0
default['avahi']['rlimit']['nofile'] = 300
default['avahi']['rlimit']['nproc'] = 3
default['avahi']['rlimit']['stack'] = 4194304
