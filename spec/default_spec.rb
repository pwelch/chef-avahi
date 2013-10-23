require 'spec_helper'

describe 'avahi::default' do
  let(:chef_run)               { ChefSpec::Runner.new.converge(described_recipe) }

  it "should install the avahi-daemon package" do
    expect(chef_run).to install_package 'avahi-daemon'
  end

  it "should start the avahi-deamon service" do
    expect(chef_run).to start_service 'avahi-daemon'
  end

  it "should enable the avahi-deamon service to start on boot" do
    expect(chef_run).to enable_service 'avahi-daemon'
  end

  it "should stop the avahi-deamon service if 'disable_service' is true" do
    chef_run.node.set['avahi']['disable_service'] = true
    chef_run.converge("avahi::default")
    expect(chef_run).to stop_service 'avahi-daemon'
  end

  it "should disable the avahi-deamon service if 'disable_service' is true" do
    chef_run.node.set['avahi']['disable_service'] = true
    chef_run.converge("avahi::default")
    expect(chef_run).not_to enable_service 'avahi-daemon'
  end

  it "should render the /etc/avahi/avahi-daemon.conf template" do
    expect(chef_run).to create_template('/etc/avahi/avahi-daemon.conf')
  end

  it "should create the /etc/avahi/avahi-daemon.conf with correct permissions" do
    expect(chef_run).to create_template('/etc/avahi/avahi-daemon.conf').with(
      user:  'root',
      group: 'root'
    )
  end
end
