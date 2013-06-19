require 'yaml'
#
# Cookbook Name:: aws-sdk
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the root directory
directory "/opt/aws" do
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
      {"default" => ["ruby-dev", "rubygems"] },
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

# get credentials data and write to a cfg file
creds = {}
creds['access_key_id'] = node['AWS-user-credentials']['access_key_id']
creds['secret_access_key'] = node['AWS-user-credentials']['secret_access_key']
creds['region'] = 'us-west-2'

Chef::Log.info("\n\n\n#{creds.to_yaml}")

File.open("/opt/aws/credentials.cfg","w+") { |f| f.write(creds.to_yaml) }

# run the configure recipe now that the AWS-SDK gem has been installed
include_recipe 'aws-sdk::configure'
