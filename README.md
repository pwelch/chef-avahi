[![Cookbook](http://img.shields.io/cookbook/v/avahi.svg)](https://supermarket.chef.io/cookbooks/avahi)
[![GitHub tag](https://img.shields.io/github/tag/pwelch/chef-avahi.svg)](https://github.com/pwelch/chef-avahi/releases)
[![Build Status](https://secure.travis-ci.org/pwelch/chef-avahi.svg)](http://travis-ci.org/pwelch/chef-avahi)

## Description
Chef cookbook that installs and configures [avahi](http://avahi.org/) the zeroconf software.

## Usage
Include `avahi::default` recipe in the `run_list`.

To disable the avahi-daemon set the attribute like so:
```
  node.default['avahi']['disable_service'] = true
```

## Development

Development requires [ChefDK](https://downloads.chef.io/chefdk)

## Testing

Running tests:
```bash
chef exec rake
chef exec kitchen verify
```

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Source code availabe [here](https://github.com/pwelch/chef-avahi)
