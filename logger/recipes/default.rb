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
file = File.new("/tmp/logfile.txt","w+")
file.puts(node.to_yaml)

# log the same information to the actual log file
#Chef::Log.info('Shreepal is testing logging.')
#Chef::Log.info(node.to_yaml)

# create the root directory
directory "/etc/aws" do
  owner "root"
  group "root"
  mode "755"
  action :create
end

# indicates which packages will be installed based on the platform
packages = value_for_platform(
    ["centos","redhat","fedora"] =>
      { "default" => [] },
    ["debian", "ubuntu"] =>
      {"default" => ["ruby-dev", "rubygems" },
    "default" => []
)

# installing the packages
packages.each do |pkg|
  package pkg do
    action :install
  end
end

# installs the gem for the aws sdk (no attributes, and default action is
# install when none is indicated)
# for gem_package details : http://docs.opscode.com/resource_gem_package.html
gem_package "aws-sdk" do
  action :install
end

# get config data and try to configure AWS
config = node['AWSconfig']
config['region'] = 'us-west-2'
AWS.config(config)
