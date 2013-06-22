require 'spec_helper'

describe 'avahi::default' do
  let(:chef_run)               {ChefSpec::ChefRunner.new}
  let(:chef_run_with_converge) {chef_run.converge('avahi::default')}

  it "should install the avahi-daemon package" do
    expect(chef_run_with_converge).to install_package "avahi-daemon"
  end

  it "should render the /etc/avahi/avahi-daemon.conf file" do
    expect(chef_run_with_converge).to create_file('/etc/avahi/avahi-daemon.conf')
  end

  it "should create the /etc/avahi/avahi-daemon.conf with correct permissions" do
    file = chef_run_with_converge.template('/etc/avahi/avahi-daemon.conf')
    expect(file).to be_owned_by('root', 'root')
  end
end
