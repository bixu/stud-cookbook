# smartos-stud

# Description

A cookbook to install stud (the [Scalable TLS Unwrapping Daemon](https://github.com/bumptech/stud) and start up/shutdown via SMF

# Requirements and notes

* This cookbook depends on the [SMF cookbook](https://github.com/livinginthepast/smf)
* The SMF configuration in the current version of the cookbook assumes that stud is not daemonized.

* Note that with the current version of stud, chroot does not work correctly with daemonize within a zone. A (hackish) workaround exists, but it has to be executed every time the system starts up:

```
# mkdir -p /var/chroot/stud/dev && touch /var/chroot/stud/dev/null && mount -F lofs /dev/null /var/chroot/stud/dev/null
```

# Sample Usage
Use a 'wrapper cookbook' to configure attributes specific to your org, and to securely create certificate files:

```ruby
node.default[:stud][:config_dir] = '/etc/stud'
node.default[:stud][:pemfile_path] = '/etc/stud/certs.pem'
node.default[:stud][:options][:backend] = '[my_backend_server]:8080'
node.default[:stud][:options][:backend] = '[*]:443'

# Add any other stud options here. Options have the same names as the parameters in stud.conf, under the
# [:stud][:options] namespace and have (we hope) reasonably sane defaults

cookbook_file node[:stud][:pemfile_path] do    # note that you need to write your .pem key
  source 'certs.pem'                           # before you call this public cookbook 
  owner 'root'
  group 'root'
  mode '0600'
end

include_recipe 'stud'
```

# Tests

```
git clone git@github.com:bixu/stud-cookbook.git
cd stud-cookbook
gem install test-kitchen
gem install kitchen-joyent
kitchen test
```

# Limitations

We have only tested this under [SmartOS](http://smartos.org/)

# Contributions

Standard GitHub process: Fork / feature branch / patch / pull request.

