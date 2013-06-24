#
# Cookbook Name:: s3-call
# Recipe:: install_gem 
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file_name = node['s3_call']['file_name']
gem_name = /-[\d*\.]+\.gem$/.match(file_name).pre_match

# installs the gem
gem_package "#{gem_name}"do
  source "/opt/temp/#{file_name}"
  action :install
end
