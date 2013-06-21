#
# Cookbook Name:: logger
# Recipe:: default
#
# Copyright 2013, ashreepal
#
# All rights reserved - Do Not Redistribute
#

require 'yaml'

# create a directory in which we can create our log file
directory "#{Dir.pwd}/temp" do
  owner "root"
  group "root"
  mode "755"
  action :create
end

template "#{Dir.pwd}/temp/logfile.txt" do
  source 'logfile.erb'
  mode '0755'
  variables :node => node.to_yaml
end

# write the node object to a file to access later
#ile.open("#{Dir.pwd}/temp/logfile.txt","w+") { |f| f.write("hi") } #node.to_yaml) }

# log node object
#Chef::Log.info("\n\n#{node.to_yaml}\n\n") 
