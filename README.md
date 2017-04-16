[![Cookbook](http://img.shields.io/cookbook/v/avahi.svg)](https://supermarket.chef.io/cookbooks/avahi)
[![GitHub tag](https://img.shields.io/github/tag/pwelch/chef-avahi.svg)](https://github.com/pwelch/chef-avahi/releases)
[![Build Status](https://secure.travis-ci.org/pwelch/chef-avahi.svg)](http://travis-ci.org/pwelch/chef-avahi)
[![Dependency Status](https://gemnasium.com/pwelch/chef-avahi.svg)](https://gemnasium.com/pwelch/chef-avahi)

## Description

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/pwelch/chef-avahi?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
Chef cookbook that installs and configures [avahi](http://avahi.org/) the zeroconf software.

## Usage
Include `avahi::default` recipe in the `run_list`.

To disable the avahi-daemon set the attribute like so:
```
  default['avahi']['disable_service'] = true
```

## Development
Development requires [Vagrant](http://vagrantup.com/) and these vagrant-plugins:
* `vagrant plugin install vagrant-berkshelf`
* `vagrant plugin install vagrant-omnibus`

## Testing
Running tests:
```bash
bundle exec strainer test
```

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Source code availabe [here](https://github.com/pwelch/chef-avahi)

## To Do
* Ensure support on other platforms (RHEL/Arch).
