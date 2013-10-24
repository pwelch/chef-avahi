require 'spec_helper'

describe 'avahi::default' do
  describe package('avahi-daemon') do
    it { should be_installed }
  end

  describe file('/etc/avahi') do
    it { should be_directory }
  end

  describe file('/etc/avahi/avahi-daemon.conf') do
    it { should be_file }
  end

  describe service('avahi-daemon') do
    it { should be_enabled }
  end

  describe service('avahi-daemon') do
    it { should be_running }
  end

  describe host('ubuntu1204-test-kitchen.local') do
    it { should be_resolvable }
  end
end
