# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-omnibus"

MEMORY = ENV['VAGRANT_MEMORY'] || '1024'
CORES  = ENV['VAGRANT_CORES']  || '2'

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", MEMORY.to_i]
    vb.customize ["modifyvm", :id, "--cpus", CORES.to_i]
  end

  config.vm.box     = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box" 

  config.vm.hostname = "avahi-vagrant"
  config.vm.network :private_network, ip: "33.33.33.10"

  # Bridged networking
  # config.vm.network :public_network

  # Enabling the Berkshelf plugin.
  # Use Berkshelf
  config.berkshelf.enabled = true
 
  # Update Chef Version
  config.omnibus.chef_version = :latest

  # Update apt-get
  config.vm.provision :shell, :inline => "apt-get update"

  # Provision with chef-solo
  config.vm.provision :chef_solo do |chef|
    chef.run_list = ["recipe[avahi::default]"]
  end
end
