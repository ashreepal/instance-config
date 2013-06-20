#
# Cookbook Name:: aws-sdk
# Recipe:: install_aws_sdk
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create the root directory
directory "/opt/aws/gems" do
  owner "root"
  group "root"
  mode "777"
  action :create
end
