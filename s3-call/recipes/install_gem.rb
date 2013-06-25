#
# Cookbook Name:: s3-call
# Recipe:: install_gem 
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file_name = node['s3_call']['file_name']

# remove the gem name from the file name (remove the version number and ".gem"
# from the end of the name)
gem_name = /-[\d*\.]+\.gem$/.match(file_name).pre_match
version = /[\d+\.]+\d/.match(/-[\d*\.]+\.gem$/.match(file_name).to_s).to_s
Chef::Log.info("Gem name is #{gem_name} and file name is #{file_name}, version: #{version}")

# installs the gem
gem_package "#{gem_name}"do
  source "/opt/temp/#{file_name}"
  version(version)
  options '--no-ri --no-rdoc'
  
  
  
  action :install
end
