#
# Cookbook Name:: stud
# Recipe:: default
#
# Copyright (C) 2014
#

include_recipe 'smf'

package 'stud' do
end

directory node[:stud][:config_dir] do
  mode '0700'
  user 'root'
  group 'root'
end

template "#{node[:stud][:config_dir]}/stud.conf" do
  mode '0700'
  user 'root'
  group 'root'
  source 'stud.conf.erb'
  notifies :restart, "service[stud]", :delayed
end

smf 'stud' do
  start_command "#{node[:stud][:install_prefix_root]}/bin/stud --config #{node[:stud][:config_dir]}/stud.conf"
  ignore ['core', 'signal']
end

service 'stud' do
  action :enable
end

