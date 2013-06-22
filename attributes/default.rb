
node.default['avahi']['disable_service'] = false

# avahi-daemon.conf values
node.default['avahi']['hostname'] = node['hostname']
node.default['avahi']['domain']   = "local"
node.default['avahi']['useipv4']  = "yes"
node.default['avahi']['useipv6']  = "no"
