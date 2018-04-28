require 'spec_helper'

describe 'avahi::default' do
  context 'When all attributes are default, on an Ubuntu' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'should install the avahi-daemon package' do
      expect(chef_run).to install_package 'avahi-daemon'
    end

    it 'should start the avahi-deamon service' do
      expect(chef_run).to start_service 'avahi-daemon'
    end

    it 'should enable the avahi-deamon service to start on boot' do
      expect(chef_run).to enable_service 'avahi-daemon'
    end

    it 'should render the /etc/avahi/avahi-daemon.conf template' do
      expect(chef_run).to create_template('/etc/avahi/avahi-daemon.conf')
    end

    it 'should create the /etc/avahi/avahi-daemon.conf with correct permissions' do
      expect(chef_run).to create_template('/etc/avahi/avahi-daemon.conf').with(
        user:  'root',
        group: 'root'
      )
    end

    context 'stopping the avahi-deamon' do
      cached(:chef_run_no_service) do
        runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
        runner.node.override['avahi']['disable_service'] = true
        runner.converge(described_recipe)
      end

      it "should stop the avahi-deamon service if 'disable_service' is true" do
        expect(chef_run_no_service).to stop_service 'avahi-daemon'
      end

      it "should disable the avahi-deamon service if 'disable_service' is true" do
        expect(chef_run_no_service).not_to enable_service 'avahi-daemon'
      end
    end
  end

  context 'When all attributes are default, on an CentOS' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'should install the avahi package' do
      expect(chef_run).to install_package 'avahi'
    end
  end
end
