require 'spec_helper'

describe 'avahi::default' do
  let(:chef_run)               {ChefSpec::ChefRunner.new}
  let(:chef_run_with_converge) {chef_run.converge('avahi::default')}

  it "should install the avahi-daemon package" do
    expect(chef_run_with_converge).to install_package 'avahi-daemon'
  end

  it "should start the avahi-deamon service" do
    expect(chef_run_with_converge).to start_service 'avahi-daemon'
  end

  it "should enable the avahi-deamon service to start on boot" do
    expect(chef_run_with_converge).to set_service_to_start_on_boot 'avahi-daemon'
  end

  it "should stop the avahi-deamon service if 'disable_service' is true" do
    chef_run.node.set['avahi']['disable_service'] = true
    chef_run.converge("avahi::default")
    expect(chef_run).to stop_service 'avahi-daemon'
  end

  it "should disable the avahi-deamon service if 'disable_service' is true" do
    chef_run.node.set['avahi']['disable_service'] = true
    chef_run.converge("avahi::default")
    expect(chef_run).not_to set_service_to_start_on_boot 'avahi-daemon'
  end

  it "should render the /etc/avahi/avahi-daemon.conf file" do
    expect(chef_run_with_converge).to create_file '/etc/avahi/avahi-daemon.conf'
  end

  it "should create the /etc/avahi/avahi-daemon.conf with correct permissions" do
    file = chef_run_with_converge.template '/etc/avahi/avahi-daemon.conf'
    expect(file).to be_owned_by 'root', 'root'
  end
end
