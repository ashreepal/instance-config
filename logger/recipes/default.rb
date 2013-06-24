#
# Cookbook Name:: logger
# Recipe:: default
#
# Copyright 2013, ashreepal
#
# All rights reserved - Do Not Redistribute
#

require 'yaml'

Chef::Log.info(Dir.pwd)
Chef::Log.info(`id`)
Chef::Log.info(`ls -l`)

# create a directory in which we can create our log file
directory '/opt/temp' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

#template '/opt/temp/logfile.txt' do
#  source 'default/logfile.erb'
#  owner 'root'
#  group 'root'
#  mode '0755'
#  variables :node_object => node.to_yaml
#end

# write the node object to a file to access later
File.open("/opt/temp/logfile.txt","w+") { |f| f.write(node.to_yaml) }

# log node object
#Chef::Log.info("\n\n#{node.to_yaml}\n\n") 
