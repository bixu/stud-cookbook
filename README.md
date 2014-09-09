# smartos-stud

# Description

A cookbook to install stud (the [Scalable TLS Unwrapping Daemon](https://github.com/bumptech/stud) and start up/shutdown via SMF

# Requirements and notes

* This cookbook depends on the [SMF cookbook](https://github.com/livinginthepast/smf)
* Note that with the current version of stud, chroot does not work correctly with daemonize within a zone.
* The SMF configuration in the current version of the cookbook assumes that stud is not daemonized.

# Sample Usage

```ruby
node.default[:stud][:config_dir] = '/etc/stud'
node.default[:stud][:pemfile_path] = '/etc/stud/certs.pem'
node.default[:stud][:options][:backend] = '[my_backend_server]:8080'
node.default[:stud][:options][:backend] = '[*]:443'

# Add any other stud options here. Options have the same names as the parameters in stud.conf, under the
# [:stud][:options] namespace and have (we hope) reasonably sane defaults

include_recipe 'stud'

cookbook_file node[:stud][:pemfile_path] do
  source 'certs.pem'
  owner 'root'
  group 'root'
  mode '0600'
end
```

# Limitations

We have only tested this under [SmartOS](http://smartos.org/)

# Contributions

Standard GitHub process: Fork / feature branch / patch / pull request.

