#
# Cookbook Name:: avahi
# Recipe:: default
#
# All rights reserved - Do Not Redistribute
#

package "avahi-daemon" do
  action :install
end

if node['avahi']['disable-service']
  service "avahi-daemon" do
    action [:disable, :stop]
  end
else
  service "avahi-daemon" do
    action [:enable, :start]
  end
end

template "/etc/avahi/avahi-daemon.conf" do
  source "avahi-daemon.conf.erb"
  owner "root"
  group "root"
  variables({
    :hostname => node['avahi']['hostname'],
    :domain   => node['avahi']['domain'],
    :useipv4  => node['avahi']['useipv4'],
    :useipv6  => node['avahi']['useipv6']
  })
  notifies :restart, "service[avahi-daemon]"
end
