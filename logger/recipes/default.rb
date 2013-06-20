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
  mode "755"
  action :create
end

# write the node object to a file to access later
File.open("/tmp/logfile.txt","w+") { |f| f.write(node.to_yaml) }

# log node object
Chef::Log.info("\n\n#{node.to_yaml}\n\n") 
