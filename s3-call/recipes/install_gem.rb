#
# Cookbook Name:: aws-sdk
# Recipe:: install_aws_sdk
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

file_name = node['s3_call']['file_name']



# installs the gem
gem_package "#{file_name.chomp(".gem")}" do
  source "/opt/aws/gems/#{file_name}"
  action :install
end