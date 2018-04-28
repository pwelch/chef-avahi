#
# Cookbook Name:: avahi
# Recipe:: default
#

package node['avahi']['package_name'] do
  action :install
end

if node['avahi']['disable_service']
  service 'avahi-daemon' do
    action [:disable, :stop]
  end
else
  service 'avahi-daemon' do
    action [:enable, :start]
  end
end

template '/etc/avahi/avahi-daemon.conf' do
  source 'avahi-daemon.conf.erb'
  owner 'root'
  group 'root'
  variables(hostname: node['avahi']['hostname'],
            domain:   node['avahi']['domain'],
            useipv4:  node['avahi']['useipv4'],
            useipv6:  node['avahi']['useipv6'])
  notifies :restart, 'service[avahi-daemon]'
end
