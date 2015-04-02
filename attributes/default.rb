default[:stud][:user] = "root"
default[:stud][:install_prefix_root] = "/opt/local"
default[:stud][:config_dir] = "/opt/local/etc/stud"

# you should override [:stud][:pemfile_path] with the path to a private .pem 
# file written by a private glue/wrapper cookbook:
default[:stud][:pemfile_path] = "/opt/local/etc/stud/example.pem"

# Encryption options
default[:stud][:options][:tls] = true
default[:stud][:options][:ssl] = false
default[:stud][:options][:ciphers] = ""
default[:stud][:options][:ssl_engine] = ""
default[:stud][:options][:prefer_server_ciphers] = false

# Socket options
default[:stud][:options][:backend] = "[127.0.0.1]:8000"
default[:stud][:options][:frontend] = "[*]:8443"

# Performance options
default[:stud][:options][:workers] = 1
default[:stud][:options][:backlog] = 100
default[:stud][:options][:keepalive_secs] = 3600

# Security options
default[:stud][:options][:chroot_path] = "/" # chroot does not work correctly with daemonize within a zone
default[:stud][:options][:user] = "stud"
default[:stud][:options][:group] = "stud"

# Logging options
default[:stud][:options][:quiet] = false
default[:stud][:options][:send_to_syslog] = false
default[:stud][:options][:syslog_facility] = "daemon"

# Special options
default[:stud][:options][:daemon] = true
default[:stud][:options][:write_ip] = false
default[:stud][:options][:write_proxy] = false
default[:stud][:options][:proxy_proxy] = false
