#
# Cookbook Name:: aws-sdk
# Recipe:: install_aws_sdk
#
# Copyright 2013, ashreepal
#
# All rights reserved - Do Not Redistribute
#

# create the root directory
directory "/opt/aws" do
  mode "0755"
  action :create
end

# indicates which packages will be installed based on the platform
packages = value_for_platform(
    ["centos", "redhat", "fedora"] =>
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
