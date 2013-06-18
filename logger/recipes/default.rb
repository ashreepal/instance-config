#
# Cookbook Name:: logger
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'yaml'

# create a directory in which we can create our log file
directory "/tmp" do
  owner "root"
  group "root"
  mode "755"
  action :create
end

file = File.new("/tmp/logfile.txt","w+")
file.puts(node.to_yaml)


Chef::Log.info('Shreepal is testing logging.')
Chef::Log.info(node.to_yaml)
