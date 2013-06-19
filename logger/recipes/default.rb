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

# write the node object to a file to access later
File.open("/tmp/logfile.txt","w+") { |f| f.write(node.to_yaml) }

# log the same information to the actual log file
#Chef::Log.info('Shreepal is testing logging.')
#Chef::Log.info(node.to_yaml)
